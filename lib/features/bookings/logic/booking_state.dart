import 'package:equatable/equatable.dart';
import 'package:unaago/core/models/booking_model.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingsLoaded extends BookingState {
  final List<BookingModel> bookings;
  BookingsLoaded(this.bookings);

  @override
  List<Object?> get props => [bookings];
}

class BookingSuccess extends BookingState {}

class BookingError extends BookingState {
  final String message;
  BookingError(this.message);

  @override
  List<Object?> get props => [message];
}
