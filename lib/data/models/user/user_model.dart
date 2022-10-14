import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({required this.uid, this.email, this.displayName, this.photoURL});

  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  static const empty = UserModel(uid: '');

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [uid, email, displayName, photoURL];
}
