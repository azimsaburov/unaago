import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/common/widgets.dart';
import 'package:unaago/core/models/car_model.dart';
import 'package:unaago/core/localization/app_localizations.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';
import 'package:unaago/features/car_management/logic/car_cubit.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  String _transmission = 'Automatic';
  String _fuelType = 'Petrol';

  @override
  void dispose() {
    _brandController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.addCar)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(label: l10n.carBrand, controller: _brandController),
            const SizedBox(height: 15),
            AppTextField(label: l10n.carModel, controller: _modelController),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: AppTextField(label: l10n.year, controller: _yearController)),
                const SizedBox(width: 15),
                Expanded(child: AppTextField(label: l10n.pricePerDay, controller: _priceController)),
              ],
            ),
            const SizedBox(height: 15),
            Text(l10n.transmission, style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                _choiceChip(l10n.automatic, 'Automatic', (v) => setState(() => _transmission = v)),
                const SizedBox(width: 10),
                _choiceChip(l10n.manual, 'Manual', (v) => setState(() => _transmission = v)),
              ],
            ),
            const SizedBox(height: 15),
            Text(l10n.fuelType, style: const TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: [
                _fuelChip(l10n.petrol, 'Petrol'),
                _fuelChip(l10n.diesel, 'Diesel'),
                _fuelChip(l10n.electric, 'Electric'),
                _fuelChip(l10n.hybrid, 'Hybrid'),
              ],
            ),
            const SizedBox(height: 15),
            AppTextField(label: l10n.description, controller: _descController),
            const SizedBox(height: 30),
            AppButton(
              text: l10n.save,
              onPressed: () {
                final authState = context.read<AuthCubit>().state;
                if (authState is Authenticated) {
                  final newCar = CarModel(
                    id: DateTime.now().toString(),
                    brand: _brandController.text,
                    model: _modelController.text,
                    year: int.tryParse(_yearController.text) ?? 2024,
                    pricePerDay: double.tryParse(_priceController.text) ?? 0.0,
                    images: [],
                    ownerId: authState.user.id,
                    description: _descController.text,
                    transmission: _transmission,
                    fuelType: _fuelType,
                  );
                  context.read<CarCubit>().addCar(newCar);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _choiceChip(String label, String value, Function(String) onSelected) {
    final isSelected = _transmission == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) onSelected(value);
      },
    );
  }

  Widget _fuelChip(String label, String value) {
    final isSelected = _fuelType == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) setState(() => _fuelType = value);
      },
    );
  }
}
