import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const UserModel._();

  const factory UserModel({
    required String uid,
    String? email,
    String? displayName,
    String? photoURL,
  }) = _UserModel;

  static const empty = UserModel(uid: '');

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
