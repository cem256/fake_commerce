import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String category;
  final String description;
  final double price;
  final String imageUrl;

  const ProductModel({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel product = ProductModel(
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
        name,
        category,
        description,
        price,
        imageUrl,
      ];
}
