import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/models/review_model.dart';
import 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final List<ReviewModel> _allReviews = [];

  ReviewCubit() : super(ReviewInitial());

  void addReview(ReviewModel review) {
    _allReviews.add(review);
    getReviewsForCar(review.carId);
  }

  void getReviewsForCar(String carId) {
    final carReviews = _allReviews.where((r) => r.carId == carId).toList();
    emit(ReviewsLoaded(carReviews));
  }

  double getAverageRating(String carId) {
    final carReviews = _allReviews.where((r) => r.carId == carId).toList();
    if (carReviews.isEmpty) return 0.0;
    final sum = carReviews.fold(0.0, (previousValue, element) => previousValue + element.rating);
    return sum / carReviews.length;
  }
}
