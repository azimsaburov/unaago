import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/features/favorite/logic/favorites_cubit.dart';
import 'package:unaago/features/marketplace/presentation/screens/car_details_screen.dart';
import 'package:unaago/features/marketplace/presentation/widgets/car_card.dart';
import 'package:unaago/core/models/car_model.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.favorites),
          centerTitle: true,
        ),
        body: BlocBuilder<FavoritesCubit, List<CarModel>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return Center(child: Text(l10n.noFavorites));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.length,
              itemBuilder: (context, index) {
                final car = state[index];
                return CarCard(
                  car: car,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CarDetailsScreen(car: car)),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
