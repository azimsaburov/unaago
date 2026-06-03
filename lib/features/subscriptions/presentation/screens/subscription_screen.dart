import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/common/widgets.dart';
import 'package:unaago/core/constants/colors.dart';
import 'package:unaago/features/subscriptions/logic/subscription_cubit.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.subscriptions)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(l10n.selectPlan, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            _buildPlanCard(
              context,
              title: 'Pro',
              price: '49\$',
              features: ['5 авто', l10n.support],
              color: ColorsConstants.primary,
            ),
            const SizedBox(height: 20),
            _buildPlanCard(
              context,
              title: 'Business',
              price: '149\$',
              features: [l10n.unlimitedCars, l10n.support],
              color: ColorsConstants.secondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context, {
    required String title,
    required String price,
    required List<String> features,
    required Color color,
  }) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 10),
            Text('$price ${l10n.monthly}', style: const TextStyle(fontSize: 18)),
            const Divider(),
            ...features.map((f) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.green),
                      const SizedBox(width: 10),
                      Text(f),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            AppButton(
              text: l10n.buyNow,
              onPressed: () => _showPaymentModal(context, title),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentModal(BuildContext context, String planName) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.payment, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            AppTextField(label: l10n.cardNumber),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: AppTextField(label: l10n.expiryDate)),
                const SizedBox(width: 15),
                const Expanded(child: AppTextField(label: 'CVV')),
              ],
            ),
            const SizedBox(height: 30),
            AppButton(
              text: '${l10n.pay} $planName',
              onPressed: () async {
                await context.read<SubscriptionCubit>().buySubscription(planName);
                Navigator.of(context).pop(); // Close modal
                Navigator.of(context).pop(); // Go back from sub screen
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
