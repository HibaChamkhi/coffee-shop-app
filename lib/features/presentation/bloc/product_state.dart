part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final ProductStatus productStatus;
  final String messages;

  const ProductState({
    this.categories = const [],
    this.products = const [],
    this.messages = "",
    this.productStatus = ProductStatus.loading,
  });

  ProductState copyWith({
    List<CategoryModel>? categories,
    List<ProductModel>? products,
    ProductStatus? productStatus,
    String? messages,
  }) {
    return ProductState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      messages: messages ?? this.messages,
      productStatus: productStatus ?? this.productStatus,
    );
  }

  @override
  List<Object> get props => [
        categories,
    products,
    productStatus,
        messages,
      ];
}

enum ProductStatus { loading, success, error }
