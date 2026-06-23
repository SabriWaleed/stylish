// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  price: (json['price'] as num?)?.toInt(),
  description: json['description'] as String?,
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  creationAt: json['creationAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'price': instance.price,
  'description': instance.description,
  'category': instance.category,
  'images': instance.images,
  'creationAt': instance.creationAt,
  'updatedAt': instance.updatedAt,
};
