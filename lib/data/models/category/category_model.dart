import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;
  final String imageUrl;

  const CategoryModel({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static CategoryModel fromSnapshot(DocumentSnapshot snap) {
    CategoryModel category = CategoryModel(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }
}
