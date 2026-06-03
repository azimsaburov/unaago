import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/constants/colors.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';
import 'package:unaago/features/auth/presentation/screens/login_screen.dart';
import 'package:unaago/features/favorite/favorite_screen.dart';
import 'package:unaago/features/home/home_screen.dart';
import 'package:unaago/features/location/location_screen.dart';
import 'package:unaago/features/profile/presentation/screens/profile_screen.dart';

class Navig extends StatefulWidget {
  final int? index;
  const Navig({super.key, this.index});

  @override
  State<Navig> createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int _currentIndex = 0;

  @override
  void initState() {
    if (widget.index != null) {
      _currentIndex = widget.index!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: _activePage,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16),
          child: _buildNavig(),
        ),
      ),
    );
  }

  Widget get _activePage {
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return FavoriteScreen();
      case 2:
        return LocationScreen();
      case 3:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  Widget _buildNavig() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsConstants.secondary2, ColorsConstants.secondary, ColorsConstants.primary2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (i) => _item(i)),
      ),
    );
  }

  Widget _item(int index) {
    final activeIcons = [Icons.home, Icons.favorite, Icons.navigation, Icons.person];
    final icons = [
      Icons.home_outlined,
      Icons.favorite_outline,
      Icons.navigation_outlined,
      Icons.person_outline,
    ];
    final isActive = index == _currentIndex;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              size: isActive ? 45 : 40,
              isActive ? activeIcons[index] : icons[index],
              color: isActive ?ColorsConstants.primary : ColorsConstants.primary2,
            ),
          ],
        ),
      ),
    );
  }
}
