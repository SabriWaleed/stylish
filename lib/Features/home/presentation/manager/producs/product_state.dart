import 'package:ecommerce_project/Features/home/data/models/product_model.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Products> products;
  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String errormessage;
  ProductsError({required this.errormessage});
}
