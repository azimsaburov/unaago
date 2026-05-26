import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/common/widgets.dart';
import 'package:unaago/core/constants/colors.dart';
import 'package:unaago/core/models/car_model.dart';
import 'package:unaago/core/models/booking_model.dart';
import 'package:unaago/core/localization/app_localizations.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';
import 'package:unaago/features/bookings/logic/booking_cubit.dart';
import 'package:unaago/features/bookings/logic/booking_state.dart';

class CarDetailsScreen extends StatefulWidget {
  final CarModel car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  DateTimeRange? _selectedDateRange;

  double get _totalPrice {
    if (_selectedDateRange == null) return 0.0;
    final days = _selectedDateRange!.duration.inDays;
    return (days == 0 ? 1 : days) * widget.car.pricePerDay;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text('${widget.car.brand} ${widget.car.model}')),
      body: BlocListener<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.bookingSuccess), backgroundColor: ColorsConstants.success),
            );
            Navigator.of(context).pop();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.grey[200],
                child: const Icon(Icons.directions_car, size: 120, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.car.brand} ${widget.car.model}',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.car.pricePerDay} ${l10n.perDay}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: ColorsConstants.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('${widget.car.year} | ${widget.car.fuelType} | ${widget.car.transmission}',
                        style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    const SizedBox(height: 20),
                    Text(l10n.description,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(widget.car.description, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 10),
                    AppButton(
                      text: _selectedDateRange == null
                          ? l10n.selectDates
                          : '${_selectedDateRange!.start.toString().split(' ')[0]} - ${_selectedDateRange!.end.toString().split(' ')[0]}',
                      onPressed: _showDatePicker,
                    ),
                    if (_selectedDateRange != null) ...[
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.totalPrice, style: const TextStyle(fontSize: 18)),
                          Text('$_totalPrice',
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorsConstants.primary)),
                        ],
                      ),
                    ],
                    const SizedBox(height: 40),
                    AppButton(
                      text: l10n.bookNow,
                      onPressed: _selectedDateRange == null ? null : _createBooking,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDateRange = picked);
    }
  }

  void _createBooking() {
    final authState = context.read<AuthCubit>().state;
    if (authState is Authenticated && _selectedDateRange != null) {
      final booking = BookingModel(
        id: DateTime.now().toString(),
        carId: widget.car.id,
        userId: authState.user.id,
        startDate: _selectedDateRange!.start,
        endDate: _selectedDateRange!.end,
        totalPrice: _totalPrice,
      );
      context.read<BookingCubit>().createBooking(booking);
    }
  }
}
