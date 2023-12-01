import 'dart:convert';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/user.dart';

class UserModel extends User {
 const UserModel(
      {required super.id,
      required super.name,
      required super.avatar,
      required super.createdAt});

  const UserModel.empty():this(id: '1', createdAt: '_empty.CreatedAt',name: '_empty.name',avatar: '_empty.avatar');


  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(jsonDecode(source) as DataMap);

  DataMap toMap() =>
      {'id': id, 'name': name, 'avatar': avatar, 'createdAt': createdAt};

  UserModel copyWith({
    String? name,
    String? id,
    String? avatar,
    String? createdAt,
  }) {
    return UserModel(
        id: id ?? this.avatar,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        createdAt: createdAt ?? this.createdAt);
  }

  UserModel.fromMap(DataMap map)
      : this(
            id: map['id'] as String,
            avatar: map['avatar'] as String,
            name: map['name'] as String,
            createdAt: map['createdAt'] as String);
}
