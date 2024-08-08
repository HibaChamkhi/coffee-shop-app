import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/data/models/category_model.dart';
import 'package:coffe_shop/features/data/models/product_model.dart';
import 'package:coffe_shop/features/domain/use_cases/get_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../core/extensions/map_failure_to_message.dart';
import '../../domain/use_cases/get_products_use_case.dart';

part 'product_event.dart';

part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsUseCase getProductsUseCase;

  ProductBloc({
    required this.getCategoriesUseCase,
    required this.getProductsUseCase,
  }) : super(const ProductState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetCategoriesEvent) {
        emit(state
            .copyWith(productStatus: ProductStatus.loading, categories: []));
        final failureOrSuggestedProducts = await getCategoriesUseCase();
        failureOrSuggestedProducts.fold(
            (suggestedOrFailure) => emit(state.copyWith(
                  messages: mapFailureToMessage(suggestedOrFailure),
                  productStatus: ProductStatus.error,
                )),
            (newsValue) => emit(state.copyWith(
                productStatus: ProductStatus.success, categories: newsValue)));
      }
      if (event is GetProductsEvent) {
        emit(
            state.copyWith(productStatus: ProductStatus.loading, products: []));
        final failureOrSuggestedProducts = await getProductsUseCase();
        failureOrSuggestedProducts.fold(
            (suggestedOrFailure) => emit(state.copyWith(
                  messages: mapFailureToMessage(suggestedOrFailure),
                  productStatus: ProductStatus.error,
                )),
            (newsValue) => emit(state.copyWith(
                productStatus: ProductStatus.success, products: newsValue)));
      }
    });
  }
}

String extractDate(String timestamp) {
  DateTime parsedDate = DateTime.parse(timestamp);
  String formattedDate =
      "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}";
  return formattedDate;
}
