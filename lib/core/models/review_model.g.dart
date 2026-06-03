// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  carId: json['carId'] as String,
  rating: (json['rating'] as num).toDouble(),
  comment: json['comment'] as String,
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'carId': instance.carId,
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
    };
