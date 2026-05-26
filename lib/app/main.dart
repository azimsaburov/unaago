import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:unaago/core/localization/app_localizations.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/bookings/logic/booking_cubit.dart';
import 'package:unaago/features/car_management/logic/car_cubit.dart';
import 'package:unaago/features/subscriptions/logic/subscription_cubit.dart';
import 'package:unaago/features/splash/cubit/splash_cubit.dart';
import 'package:unaago/features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit()..startSplash(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<CarCubit>(
          create: (context) => CarCubit(),
        ),
        BlocProvider<BookingCubit>(
          create: (context) => BookingCubit(),
        ),
        BlocProvider<SubscriptionCubit>(
          create: (context) => SubscriptionCubit(),
        ),
      ],

      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ru'),
          Locale('en'),
        ],
      ),
    );
  }
}
