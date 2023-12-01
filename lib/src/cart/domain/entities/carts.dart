// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class Product extends Equatable {
//   int? id;
//   String? title;
//   int? price;
//   String? description;
//   List<dynamic>? images;
//   DateTime? creationAt;
//   DateTime? updatedAt;
//   Category? category;

//   Product({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.images,
//     // this.creationAt,
//     // this.updatedAt,
//     this.category,
//   });

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         title,
//         price,
//         description,
//         images,
//         // creationAt,
//         // updatedAt,
//       ];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'title': title,
//       'price': price,
//       'description': description,
//       'images': images,
//       // 'creationAt': creationAt?.millisecondsSinceEpoch,
//       // 'updatedAt': updatedAt?.millisecondsSinceEpoch,
//       'category': category?.toMap(),
//     };
//   }

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       id: map['id'] != null ? map['id'] as int : null,
//       title: map['title'] != null ? map['title'] as String : null,
//       price: map['price'] != null ? map['price'] as int : null,
//       description:
//           map['description'] != null ? map['description'] as String : null,
//       images: map['images'] != null
//           ? List<dynamic>.from((map['images'] as List<String>))
//           : null,
//       // creationAt: map['creationAt'] != null
//       //     ? DateTime.fromMillisecondsSinceEpoch(map['creationAt'] as int)
//       //     : null,
//       // updatedAt: map['updatedAt'] != null
//       //     ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
//       //     : null,
//       category: map['category'] != null
//           ? Category.fromMap(map['category'] as Map<String, dynamic>)
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Product.fromJson(String source) =>
//       Product.fromMap(json.decode(source) as Map<String, dynamic>);

//   Product copyWith({
//     int? id,
//     String? title,
//     int? price,
//     String? description,
//     List<String>? images,
//     // DateTime? creationAt,
//     // DateTime? updatedAt,
//     Category? category,
//   }) {
//     return Product(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       price: price ?? this.price,
//       description: description ?? this.description,
//       images: images ?? this.images,
//       // creationAt: creationAt ?? this.creationAt,
//       // updatedAt: updatedAt ?? this.updatedAt,
//       category: category ?? this.category,
//     );
//   }
// }

// class Category extends Equatable {
//   int? id;
//   String? name;
//   String? image;
//   // DateTime? creationAt;
//   // DateTime? updatedAt;

//   Category({
//     this.id,
//     this.name,
//     this.image,
//     // this.creationAt,
//     // this.updatedAt,
//   });

//   @override
//   // TODO: implement props
//   List<Object?> get props => [id, name,image];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'image': image,
//       // 'creationAt': creationAt?.millisecondsSinceEpoch,
//       // 'updatedAt': updatedAt?.millisecondsSinceEpoch,
//     };
//   }

//   factory Category.fromMap(Map<String, dynamic> map) {
//     return Category(
//       id: map['id'] != null ? map['id'] as int : null,
//       name: map['name'] != null ? map['name'] as String : null,
//       image: map['image'] != null ? map['image'] as String : null,
//       // creationAt: map['creationAt'] != null
//       //     ? DateTime.fromMillisecondsSinceEpoch(map['creationAt'] as int)
//       //     : null,
//       // updatedAt: map['updatedAt'] != null
//       //     ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
//       //     : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Category.fromJson(String source) =>
//       Category.fromMap(json.decode(source) as Map<String, dynamic>);

//   Category copyWith({
//     int? id,
//     String? name,
//     String? image,
//     // DateTime? creationAt,
//     // DateTime? updatedAt,
//   }) {
//     return Category(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       image: image ?? this.image,
//       // creationAt: creationAt ?? this.creationAt,
//       // updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }
// }

// class CategoryModel extends Category {
//   CategoryModel({
//     super.id,
//     super.name,
//     super.image,
//     // super.creationAt,
//     // super.updatedAt,
//   });

//   @override
//   // TODO: implement props
//   List<Object?> get props => [id, name];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'image': image,
//       // 'creationAt': creationAt?.millisecondsSinceEpoch,
//       // 'updatedAt': updatedAt?.millisecondsSinceEpoch,
//     };
//   }

//   factory CategoryModel.fromMap(Map<String, dynamic> map) {
//     return CategoryModel(
//       id: map['id'] != null ? map['id'] as int : null,
//       name: map['name'] != null ? map['name'] as String : null,
//       image: map['image'] != null ? map['image'] as String : null,
//       // creationAt: map['creationAt'] != null
//       //     ? DateTime.fromMillisecondsSinceEpoch(map['creationAt'] as int)
//       //     : null,
//       // updatedAt: map['updatedAt'] != null
//       //     ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
//       //     : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CategoryModel.fromJson(String source) =>
//       CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   Category copyWith({
//     int? id,
//     String? name,
//     String? image,
//     // DateTime? creationAt,
//     // DateTime? updatedAt,
//   }) {
//     return Category(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       image: image ?? this.image,
//       // creationAt: creationAt ?? this.creationAt,
//       // updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }
// }


import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  
  

 

  Product copyWith({
    int? id,
    String? title,
    String? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price']!.toString() : null,
      description: map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      rating: map['rating'] != null ? Rating.fromMap(map['rating'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
  
  @override
  // TODO: implement props
  List<Object?> get props => [id,title,price,description,category,image,rating];
}

class Rating extends Equatable {
  String? rate;
  int? count;

   Rating({
    this.rate,
    this.count,
  });
  
  

  Rating copyWith({
    String? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'] != null ? map['rate']!.toString() : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
  
  @override
  // TODO: implement props
  List<Object?> get props => [rate,count];
}
