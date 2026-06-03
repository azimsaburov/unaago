import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  final String id;
  final String carId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final double totalPrice;
  final String status; // pending, confirmed, cancelled, completed

  BookingModel({
    required this.id,
    required this.carId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    this.status = 'pending',
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
