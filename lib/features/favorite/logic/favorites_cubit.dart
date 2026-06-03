import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/models/car_model.dart';

class FavoritesCubit extends Cubit<List<CarModel>> {
  FavoritesCubit() : super([]);

  void toggleFavorite(CarModel car) {
    final current = List<CarModel>.from(state);
    if (current.any((c) => c.id == car.id)) {
      current.removeWhere((c) => c.id == car.id);
    } else {
      current.add(car);
    }
    emit(current);
  }

  bool isFavorite(String carId) {
    return state.any((c) => c.id == carId);
  }
}
