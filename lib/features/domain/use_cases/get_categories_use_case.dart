import 'package:coffe_shop/features/data/models/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures.dart';
import '../repositories/product_repository.dart';

@Injectable()
class GetCategoriesUseCase {
  final ProductRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<Either<Failure, List<CategoryModel>>> call() async {
    return await repository.getAllCategories();
  }
}
