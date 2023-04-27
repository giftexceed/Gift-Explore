import 'dart:convert';

class DataModel {
  DataModel({
    this.name,
    this.description,
    this.img,
    this.location,
    this.people,
    this.price,
    this.stars,
  });

  DataModel.fromJson(Map<String, Object?> json)
      : this(
          name: json['name'] == null ? null : json['name'] as String,
          img: json['img'] == null ? null : json['img'] as String,
          price: json['price'] == null ? null : json['price'] as int,
          people: json['people'] == null ? null : json['people'] as int,
          stars: json['stars'] == null ? null : json['stars'] as int,
          description: json['description'] == null
              ? null
              : json['description'] as String,
          location:
              json['location'] == null ? null : json['location'] as String,
        );

  final String? name;
  final String? img;
  final int? price;
  final int? people;
  final int? stars;
  final String? description;
  final String? location;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'img': img,
      'price': price,
      'people': people,
      'stars': stars,
      'description': description,
      'location': location,
    };
  }
}
