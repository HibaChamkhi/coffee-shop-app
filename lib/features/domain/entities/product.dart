import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String? description;
  final double? price;
  final int? categoryId;
  final String? image;

  const Product( {
    required this.id,
    required this.name,
     this.description,
     this.price,
     this.categoryId,
    this.image,
  });

  @override
  List<Object?> get props => [id, name,description,price,categoryId,image];
}
