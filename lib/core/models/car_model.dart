import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@JsonSerializable()
class CarModel {
  final String id;
  final String brand;
  final String model;
  final int year;
  final double pricePerDay;
  final List<String> images;
  final String ownerId;
  final String description;
  final String transmission; // Manual, Automatic
  final String fuelType; // Petrol, Diesel, Electric, Hybrid
  final bool isAvailable;

  CarModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.pricePerDay,
    required this.images,
    required this.ownerId,
    required this.description,
    required this.transmission,
    required this.fuelType,
    this.isAvailable = true,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => _$CarModelFromJson(json);
  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}
