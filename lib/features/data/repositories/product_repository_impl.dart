import 'dart:io';

import 'package:coffe_shop/features/data/models/category_model.dart';
import 'package:coffe_shop/features/data/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/exception.dart';
import '../../../core/failures.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_source/data_source/product_data_source.dart';


@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl(this.productDataSource,
      this.networkInfo
      );

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    if (await networkInfo.isConnected) {
    try {
      final remoteGetCategories =
      await productDataSource.getAllCategories() ;
      return Right(remoteGetCategories);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on UnknownException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  } else {
      return Left(OfflineFailure());
    }
  }
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
    try {
      final remoteGetProduct =
      await productDataSource.getAllProducts() ;
      return Right(remoteGetProduct);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on UnknownException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  } else {
      return Left(OfflineFailure());
    }
  }
}
