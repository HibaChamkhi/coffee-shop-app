import 'package:coffe_shop/features/data/models/category_model.dart';
import 'package:coffe_shop/features/data/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures.dart';
import '../repositories/product_repository.dart';

@Injectable()
class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<Either<Failure, List<ProductModel>>> call() async {
    return await repository.getAllProducts();
  }
}
