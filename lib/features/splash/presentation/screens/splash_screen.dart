import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/constants/colors.dart';
import 'package:unaago/core/constants/images_paths.dart';
import 'package:unaago/app/navigation/navig.dart';
import 'package:unaago/features/splash/cubit/splash_cubit.dart';
import 'package:unaago/features/splash/cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Navig()),
            );
          }
          if (state is SplashError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(ImagePaths.logo)],
          ),
        ),
      ),
    );
  }
}
