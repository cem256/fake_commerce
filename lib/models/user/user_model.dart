import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({this.id, this.email = ""});

  final String? id;
  final String email;

  @override
  List<Object?> get props => [id, email];

  UserModel copyWith({
    String? id,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      email: snap['email'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'email': email,
    };
  }
}
