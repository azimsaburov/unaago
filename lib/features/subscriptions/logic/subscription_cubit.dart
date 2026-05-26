import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class SubscriptionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionLoading extends SubscriptionState {}

class SubscriptionActive extends SubscriptionState {
  final String planName;
  SubscriptionActive(this.planName);

  @override
  List<Object?> get props => [planName];
}

class SubscriptionInactive extends SubscriptionState {}

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInactive());

  Future<void> buySubscription(String planName) async {
    emit(SubscriptionLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(SubscriptionActive(planName));
  }
}
