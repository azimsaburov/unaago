import 'package:equatable/equatable.dart';
import 'package:unaago/core/models/car_model.dart';

abstract class CarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitial extends CarState {}

class CarLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<CarModel> cars;
  CarsLoaded(this.cars);

  @override
  List<Object?> get props => [cars];
}

class CarError extends CarState {
  final String message;
  CarError(this.message);

  @override
  List<Object?> get props => [message];
}
