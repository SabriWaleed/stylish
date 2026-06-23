import 'package:ecommerce_project/Features/home/data/repos/products_repo.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/producs/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;
  ProductsCubit({required this.homeRepo}) : super(ProductsInitial());

  Future<void> getProducts() async {
    if (isClosed) return;

    emit(ProductsLoading());
    final response = await homeRepo.getAllProducts();

    if (isClosed) return;
    response.fold(
      (error) => emit(ProductsError(errormessage: error.errorMessage)),
      (products) => emit(ProductsLoaded(products: products)),
    );
  }

  Future<void> getProductsByCategory({required String categoryId}) async {
    if (isClosed || categoryId.trim().isEmpty) return;

    emit(ProductsLoading());
    final response = await homeRepo.getProductsByCategory(
      categoryId: categoryId,
    );

    if (isClosed) return;
    response.fold(
      (error) => emit(ProductsError(errormessage: error.errorMessage)),
      (products) => emit(ProductsLoaded(products: products)),
    );
  }
}
