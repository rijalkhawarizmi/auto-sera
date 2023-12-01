import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String avatar;
  final String createdAt;

  const User.empty()
      : this(
            id: '1',
            createdAt: '_empty.CreatedAt',
            name: '_empty.name',
            avatar: '_empty.avatar');

  const User(
      {required this.id,
      required this.name,
      required this.avatar,
      required this.createdAt});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, avatar, createdAt];
}
