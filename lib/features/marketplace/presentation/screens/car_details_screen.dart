import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/common/widgets.dart';
import 'package:unaago/core/constants/colors.dart';
import 'package:unaago/core/models/car_model.dart';
import 'package:unaago/core/models/booking_model.dart';
import 'package:unaago/core/models/review_model.dart';
import 'package:unaago/core/localization/app_localizations.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';
import 'package:unaago/features/bookings/logic/booking_cubit.dart';
import 'package:unaago/features/bookings/logic/booking_state.dart';
import 'package:unaago/features/reviews/logic/review_cubit.dart';
import 'package:unaago/features/reviews/logic/review_state.dart';

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
  void initState() {
    super.initState();
    context.read<ReviewCubit>().getReviewsForCar(widget.car.id);
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
                    Text(l10n.reviews, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _buildReviewsList(),
                    const SizedBox(height: 20),
                    AppButton(text: l10n.leaveReview, onPressed: _showReviewModal),
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

  Widget _buildReviewsList() {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is ReviewsLoaded) {
          if (state.reviews.isEmpty) return Text(l10n.noReviews);
          return Column(
            children: state.reviews.map((review) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(review.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(review.comment),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(review.rating.toString()),
                ],
              ),
            )).toList(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  void _showReviewModal() {
    final l10n = AppLocalizations.of(context)!;
    final commentController = TextEditingController();
    double selectedRating = 5.0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.leaveReview, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => IconButton(
                icon: const Icon(Icons.star, color: Colors.orange),
                onPressed: () => selectedRating = index + 1.0,
              )),
            ),
            AppTextField(label: l10n.writeComment, controller: commentController),
            const SizedBox(height: 20),
            AppButton(
              text: l10n.save,
              onPressed: () {
                final authState = context.read<AuthCubit>().state;
                if (authState is Authenticated) {
                  final review = ReviewModel(
                    id: DateTime.now().toString(),
                    userId: authState.user.id,
                    userName: authState.user.name,
                    carId: widget.car.id,
                    rating: selectedRating,
                    comment: commentController.text,
                    date: DateTime.now(),
                  );
                  context.read<ReviewCubit>().addReview(review);
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 20),
          ],
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
