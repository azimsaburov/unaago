// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
  id: json['id'] as String,
  carId: json['carId'] as String,
  userId: json['userId'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  totalPrice: (json['totalPrice'] as num).toDouble(),
  status: json['status'] as String? ?? 'pending',
);

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carId': instance.carId,
      'userId': instance.userId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'status': instance.status,
    };
