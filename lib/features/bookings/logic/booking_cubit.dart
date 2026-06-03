import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/models/booking_model.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final List<BookingModel> _bookings = [];

  BookingCubit() : super(BookingInitial());

  Future<void> createBooking(BookingModel booking) async {
    emit(BookingLoading());
    await Future.delayed(const Duration(seconds: 1));
    _bookings.add(booking);
    emit(BookingSuccess());
    emit(BookingsLoaded(List.from(_bookings)));
  }

  void getMyBookings(String userId) {
    emit(BookingsLoaded(_bookings.where((b) => b.userId == userId).toList()));
  }
}
