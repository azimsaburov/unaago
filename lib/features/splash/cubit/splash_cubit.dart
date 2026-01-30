import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(SplashInitial());

  Future<void> startSplash() async {

    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      emit(SplashSuccess());
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}