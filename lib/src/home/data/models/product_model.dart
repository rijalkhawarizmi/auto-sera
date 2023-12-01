// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../../domain/entities/product.dart';

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


// import 'dart:convert';

// import '../../domain/entities/product.dart';

// class ProductModel extends Product {

//   ProductModel({
//     super.id,
//     super.title,
//     super.price,
//     super.description,
//     super.category,
//     super.image,
//     super.rating,
//   });
  
  

 

//   ProductModel copyWith({
//     int? id,
//     String? title,
//     String? price,
//     String? description,
//     String? category,
//     String? image,
//     Rating? rating,
//   }) {
//     return ProductModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       price: price ?? this.price,
//       description: description ?? this.description,
//       category: category ?? this.category,
//       image: image ?? this.image,
//       rating: rating ?? this.rating,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'title': title,
//       'price': price,
//       'description': description,
//       'category': category,
//       'image': image,
//       'rating': rating?.toMap(),
//     };
//   }

//   factory ProductModel.fromMap(Map<String, dynamic> map) {
//     return ProductModel(
//       id: map['id'] != null ? map['id'] as int : null,
//       title: map['title'] != null ? map['title'] as String : null,
//       price: map['price'] != null ? map['price']!.toString() : null,
//       description: map['description'] != null ? map['description'] as String : null,
//       category: map['category'] != null ? map['category'] as String : null,
//       image: map['image'] != null ? map['image'] as String : null,
//       rating: map['rating'] != null ? Rating.fromMap(map['rating'] as Map<String,dynamic>) : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   bool get stringify => true;
  
//   @override
//   // TODO: implement props
//   List<Object?> get props => [id,title,price,description,category,image,rating];
// }

// class RatingModel extends Rating {
 

//    RatingModel({
//     super.rate,
//     super.count,
//   });
  
  

//   RatingModel copyWith({
//     String? rate,
//     int? count,
//   }) {
//     return RatingModel(
//       rate: rate ?? this.rate,
//       count: count ?? this.count,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'rate': rate,
//       'count': count,
//     };
//   }

//   factory RatingModel.fromMap(Map<String, dynamic> map) {
//     return RatingModel(
//       rate: map['rate'] != null ? map['rate']!.toString() : null,
//       count: map['count'] != null ? map['count'] as int : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory RatingModel.fromJson(String source) => RatingModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   bool get stringify => true;
  
//   @override
//   // TODO: implement props
//   List<Object?> get props => [rate,count];
// }
