import 'package:ecommerce_project/Features/home/data/models/category_model.dart';

class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;
  CategoriesLoaded({required this.categories});
}

class CategoriesError extends CategoriesState {
  final String errormessage;
  CategoriesError({required this.errormessage});
}
