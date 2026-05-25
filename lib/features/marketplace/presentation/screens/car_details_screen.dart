import 'package:flutter/material.dart';
import 'package:unaago/core/common/widgets.dart';
import 'package:unaago/core/constants/colors.dart';
import 'package:unaago/core/models/car_model.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class CarDetailsScreen extends StatelessWidget {
  final CarModel car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text('${car.brand} ${car.model}')),
      body: SingleChildScrollView(
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
                        '${car.brand} ${car.model}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${car.pricePerDay} ${l10n.perDay}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ColorsConstants.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('${car.year} | ${car.fuelType} | ${car.transmission}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 20),
                  Text(l10n.description,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(car.description, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 40),
                  AppButton(text: l10n.bookNow, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
