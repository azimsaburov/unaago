// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
  id: json['id'] as String,
  brand: json['brand'] as String,
  model: json['model'] as String,
  year: (json['year'] as num).toInt(),
  pricePerDay: (json['pricePerDay'] as num).toDouble(),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  ownerId: json['ownerId'] as String,
  description: json['description'] as String,
  transmission: json['transmission'] as String,
  fuelType: json['fuelType'] as String,
  isAvailable: json['isAvailable'] as bool? ?? true,
);

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
  'id': instance.id,
  'brand': instance.brand,
  'model': instance.model,
  'year': instance.year,
  'pricePerDay': instance.pricePerDay,
  'images': instance.images,
  'ownerId': instance.ownerId,
  'description': instance.description,
  'transmission': instance.transmission,
  'fuelType': instance.fuelType,
  'isAvailable': instance.isAvailable,
};
