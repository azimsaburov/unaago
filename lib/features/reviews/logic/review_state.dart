import 'package:equatable/equatable.dart';
import 'package:unaago/core/models/review_model.dart';

abstract class ReviewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewsLoaded extends ReviewState {
  final List<ReviewModel> reviews;
  ReviewsLoaded(this.reviews);

  @override
  List<Object?> get props => [reviews];
}

class ReviewSuccess extends ReviewState {}

class ReviewError extends ReviewState {
  final String message;
  ReviewError(this.message);

  @override
  List<Object?> get props => [message];
}
