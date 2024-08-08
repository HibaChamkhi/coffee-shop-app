import 'dart:async';
import 'package:coffe_shop/features/data/models/category_model.dart';
import 'package:coffe_shop/features/data/models/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/exception.dart';


abstract class ProductDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<ProductModel>> getAllProducts();
}

@Injectable(as: ProductDataSource)
class ProductRemoteDataSourceImpl implements ProductDataSource {
  ProductRemoteDataSourceImpl();
  final supabase = Supabase.instance.client;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      List<Map<String, dynamic>> response =
      await supabase.from('categories').select('*');
      var categories = response
          .map((categoryData) => CategoryModel.fromJson(categoryData))
          .toList();
      return categories;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts()async {
    try {
      List<Map<String, dynamic>> response =
      await supabase.from('coffees').select('*');
      var coffees = response
          .map((coffeeData) => ProductModel.fromJson(coffeeData))
          .toList();
      return coffees;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}

