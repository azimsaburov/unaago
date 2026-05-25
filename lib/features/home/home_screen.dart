import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/features/car_management/logic/car_cubit.dart';
import 'package:unaago/features/car_management/logic/car_state.dart';
import 'package:unaago/features/marketplace/presentation/screens/car_details_screen.dart';
import 'package:unaago/features/marketplace/presentation/widgets/car_card.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('UnaaGo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_outlined),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  context.read<CarCubit>().searchCars(value);
                },
                decoration: InputDecoration(
                  hintText: l10n.search,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.tune),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CarCubit, CarState>(
                builder: (context, state) {
                  if (state is CarsLoaded) {
                    if (state.cars.isEmpty) {
                      return Center(child: Text(l10n.emptyCarsList));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.cars.length,
                      itemBuilder: (context, index) {
                        return CarCard(
                          car: state.cars[index],
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CarDetailsScreen(car: state.cars[index]),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
