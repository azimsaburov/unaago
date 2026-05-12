import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/features/car_management/logic/car_cubit.dart';
import 'package:unaago/features/car_management/logic/car_state.dart';
import 'package:unaago/features/car_management/presentation/screens/add_car_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.myCars)),
      body: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          if (state is CarInitial) {
            final authState = context.read<AuthCubit>().state;
            if (authState is Authenticated) {
              context.read<CarCubit>().getMyCars(authState.user.id);
            }
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CarLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CarsLoaded) {
            if (state.cars.isEmpty) {
              return Center(child: Text(l10n.emptyCarsList));
            }
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                final car = state.cars[index];
                return ListTile(
                  title: Text('${car.brand} ${car.model}'),
                  subtitle: Text('${car.pricePerDay} / day'),
                  trailing: const Icon(Icons.edit),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddCarScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
