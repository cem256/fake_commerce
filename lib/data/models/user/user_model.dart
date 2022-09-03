import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({required this.id, this.email, this.name, this.photo});

  final String id;
  final String? email;
  final String? name;
  final String? photo;

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
