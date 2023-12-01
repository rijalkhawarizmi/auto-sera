import 'dart:convert';

import 'package:auto_sera/src/search/domain/entities/search.dart';

class ProductModel extends Product {
  ProductModel({
    super.id,
    super.title,
    super.price,
    super.description,
    super.images,
    // super.creationAt,
    // super.updatedAt,
    super.category,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        images,
        // creationAt,
        // updatedAt,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      // 'creationAt': creationAt?.millisecondsSinceEpoch,
      // 'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'category': category?.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      images: map['images'] != null
          ? List<dynamic>.from((map['images'] as List<dynamic>))
          : null,
      // creationAt: map['creationAt'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['creationAt'] as int)
      //     : null,
      // updatedAt: map['updatedAt'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
      //     : null,
      category: map['category'] != null
          ? Category.fromMap(map['category'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Product copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    List<dynamic>? images,
    // DateTime? creationAt,
    // DateTime? updatedAt,
    Category? category,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      // creationAt: creationAt ?? this.creationAt,
      // updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }
}

class CategoryModel extends Category {
  CategoryModel({
    super.id,
    super.name,
    super.image,
    // super.creationAt,
    // super.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      // 'creationAt': creationAt?.millisecondsSinceEpoch,
      // 'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      // creationAt: map['creationAt'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['creationAt'] as int)
      //     : null,
      // updatedAt: map['updatedAt'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
      //     : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
    // DateTime? creationAt,
    // DateTime? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      // creationAt: creationAt ?? this.creationAt,
      // updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
