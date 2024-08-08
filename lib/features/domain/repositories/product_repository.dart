

import 'package:coffe_shop/features/data/models/category_model.dart';
import 'package:coffe_shop/features/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}

