import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/Core/errors/failure.dart';
import 'package:ecommerce_project/Core/networking/api_consumer.dart';
import 'package:ecommerce_project/Core/networking/api_endpoints.dart';
import 'package:ecommerce_project/Features/home/data/models/category_model.dart';
import 'package:ecommerce_project/Features/home/data/models/product_model.dart';
import 'package:ecommerce_project/Features/home/data/repos/products_repo.dart';

class ProductsRepoImplementation implements HomeRepo {
  final ApiConsumer apiConsumer;

  ProductsRepoImplementation(this.apiConsumer);

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final response = await apiConsumer.get(ApiEndpoints.categories);
      List<Category> categorys = [];
      for (var category in response) {
        categorys.add(Category.fromJson(category));
      }
      return right(categorys);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString(), message: null));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getAllProducts({
    required int offset,
    required int limit,
  }) async {
    try {
      final response = await apiConsumer.get(
        ApiEndpoints.product,
        queryParameters: {'offset': offset, 'limit': limit},
      );
      List<Products> products = [];
      for (var product in response) {
        products.add(Products.fromJson(product));
      }
      return right(products);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString(), message: null));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getProductsByCategory({
    required String categoryId,
  }) async {
    try {
      final response = await apiConsumer.get(
        ApiEndpoints.productByCategory(categoryId),
      );
      List<Products> products = [];
      for (var product in response) {
        products.add(Products.fromJson(product));
      }
      return right(products);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString(), message: null));
    }
  }
}
