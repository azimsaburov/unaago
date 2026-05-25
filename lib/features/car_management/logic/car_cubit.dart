import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/models/car_model.dart';
import 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  final List<CarModel> _allCars = [];

  CarCubit() : super(CarInitial());

  /// Добавление нового авто.
  Future<void> addCar(CarModel car) async {
    emit(CarLoading());
    await Future.delayed(const Duration(seconds: 1)); // Имитация сети
    _allCars.add(car);
    emit(CarsLoaded(List.from(_allCars)));
  }

  /// Получение списка своих авто (в данном MVP - просто все добавленные).
  void getMyCars(String ownerId) {
    emit(CarsLoaded(_allCars.where((c) => c.ownerId == ownerId).toList()));
  }

  /// Получение всех авто для маркетплейса.
  void getAllCars() {
    emit(CarsLoaded(List.from(_allCars)));
  }

  /// Поиск и фильтрация.
  void searchCars(String query) {
    if (query.isEmpty) {
      emit(CarsLoaded(List.from(_allCars)));
      return;
    }
    final filtered = _allCars.where((car) {
      return car.brand.toLowerCase().contains(query.toLowerCase()) ||
          car.model.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(CarsLoaded(filtered));
  }
}
