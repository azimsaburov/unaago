import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';
import 'package:unaago/features/bookings/presentation/screens/my_bookings_screen.dart';
import 'package:unaago/features/car_management/presentation/screens/my_cars_screen.dart';
import 'package:unaago/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:unaago/core/models/user_model.dart';
import 'package:unaago/core/localization/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.profile), centerTitle: true),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final user = state is Authenticated ? state.user : null;
            final isOwner = user?.role == UserRole.owner || user?.role == UserRole.company;

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                if (user != null) ...[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                          const SizedBox(height: 10),
                          Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(user.email, style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
                ProfileListTile(
                  leading: '📅',
                  title: l10n.myBookings,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyBookingsScreen()),
                    );
                  },
                ),
                if (isOwner)
                  ProfileListTile(
                    leading: '🚗',
                    title: l10n.myCars,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const MyCarsScreen()),
                      );
                    },
                  ),
                ProfileListTile(
                  leading: '⚙️',
                  title: l10n.settings,
                ),
                ProfileListTile(
                  leading: '🚪',
                  title: l10n.logout,
                  onTap: () {
                    context.read<AuthCubit>().logout();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
