import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/models/car_model.dart';
import 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  final List<CarModel> _myCars = [];

  CarCubit() : super(CarInitial());

  /// Добавление нового авто.
  Future<void> addCar(CarModel car) async {
    emit(CarLoading());
    await Future.delayed(const Duration(seconds: 1)); // Имитация сети
    _myCars.add(car);
    emit(CarsLoaded(List.from(_myCars)));
  }

  /// Получение списка своих авто.
  void getMyCars(String ownerId) {
    emit(CarsLoaded(List.from(_myCars)));
  }
}
