import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:unaago/features/car_management/logic/car_cubit.dart';
import 'package:unaago/features/car_management/logic/car_state.dart';
import 'package:unaago/features/marketplace/presentation/screens/car_details_screen.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.locations), centerTitle: true),
      body: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          final cars = state is CarsLoaded ? state.cars : [];

          return FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(42.8746, 74.5698), // Бишкек для примера
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.unaago.app',
              ),
              MarkerLayer(
                markers: cars.map((car) {
                  // Генерируем случайную позицию рядом для демо
                  final lat = 42.8746 + (car.id.hashCode % 100) * 0.0001;
                  final lng = 74.5698 + (car.id.hashCode % 50) * 0.0001;

                  return Marker(
                    point: LatLng(lat, lng),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CarDetailsScreen(car: car)),
                        );
                      },
                      child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
