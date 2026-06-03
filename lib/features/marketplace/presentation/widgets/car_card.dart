import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/constants/colors.dart';
import 'package:unaago/core/models/car_model.dart';
import 'package:unaago/features/favorite/logic/favorites_cubit.dart';
import 'package:unaago/features/reviews/logic/review_cubit.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final VoidCallback onTap;

  const CarCard({super.key, required this.car, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: const Center(child: Icon(Icons.directions_car, size: 80, color: Colors.grey)),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: BlocBuilder<FavoritesCubit, List<CarModel>>(
                    builder: (context, state) {
                      final isFav = context.read<FavoritesCubit>().isFavorite(car.id);
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                          onPressed: () => context.read<FavoritesCubit>().toggleFavorite(car),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${car.brand} ${car.model}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            context.read<ReviewCubit>().getAverageRating(car.id).toStringAsFixed(1),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Text(car.transmission, style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${car.pricePerDay} ${l10n.perDay}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsConstants.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
