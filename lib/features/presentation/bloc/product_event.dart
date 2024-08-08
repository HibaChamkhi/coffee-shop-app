part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetCategoriesEvent extends ProductEvent {}
class GetProductsEvent extends ProductEvent {}