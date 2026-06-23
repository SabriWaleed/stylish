import 'package:dartz/dartz.dart'; // مكتبه بستخدمها علشان اتعامل مع الفانكشنز وفيها فيتشر الايزر والليفت والرايت علشان اتعامل مع حالات النجاح والفشل بدل التراي والكاتش التقليدي
import 'package:ecommerce_project/Core/errors/failure.dart';
import 'package:ecommerce_project/Features/home/data/models/product_model.dart';
import 'package:ecommerce_project/Features/home/data/models/category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Products>>> getAllProducts();
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, List<Products>>> getProductsByCategory({
    required String categoryId,
  });
}
