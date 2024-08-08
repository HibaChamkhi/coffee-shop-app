// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coffe_shop/core/di/core_module.dart' as _i924;
import 'package:coffe_shop/core/network/network_info.dart' as _i991;
import 'package:coffe_shop/features/data/data_source/data_source/product_data_source.dart'
    as _i532;
import 'package:coffe_shop/features/data/repositories/product_repository_impl.dart'
    as _i751;
import 'package:coffe_shop/features/domain/repositories/product_repository.dart'
    as _i470;
import 'package:coffe_shop/features/domain/use_cases/get_categories_use_case.dart'
    as _i291;
import 'package:coffe_shop/features/domain/use_cases/get_products_use_case.dart'
    as _i884;
import 'package:coffe_shop/features/presentation/bloc/product_bloc.dart'
    as _i788;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i519.Client>(() => coreModule.httpClient);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => coreModule.dataConnectionChecker);
    gh.factory<_i532.ProductDataSource>(
        () => _i532.ProductRemoteDataSourceImpl());
    gh.factory<_i991.NetworkInfo>(
        () => _i991.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.factory<_i470.ProductRepository>(() => _i751.ProductRepositoryImpl(
          gh<_i532.ProductDataSource>(),
          gh<_i991.NetworkInfo>(),
        ));
    gh.factory<_i291.GetCategoriesUseCase>(() =>
        _i291.GetCategoriesUseCase(repository: gh<_i470.ProductRepository>()));
    gh.factory<_i884.GetProductsUseCase>(() =>
        _i884.GetProductsUseCase(repository: gh<_i470.ProductRepository>()));
    gh.factory<_i788.ProductBloc>(() => _i788.ProductBloc(
          getCategoriesUseCase: gh<_i291.GetCategoriesUseCase>(),
          getProductsUseCase: gh<_i884.GetProductsUseCase>(),
        ));
    return this;
  }
}

class _$CoreModule extends _i924.CoreModule {}
