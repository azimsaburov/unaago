import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';
import 'package:unaago/features/bookings/logic/booking_cubit.dart';
import 'package:unaago/features/bookings/logic/booking_state.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    if (authState is Authenticated) {
      context.read<BookingCubit>().getMyBookings(authState.user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.myBookings)),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BookingsLoaded) {
            if (state.bookings.isEmpty) {
              return Center(child: Text(l10n.emptyCarsList)); // Using same empty key
            }
            return ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (context, index) {
                final booking = state.bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Booking #${booking.id.substring(0, 8)}'),
                    subtitle: Text('${l10n.totalPrice}: ${booking.totalPrice}'),
                    trailing: Text(booking.status),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
