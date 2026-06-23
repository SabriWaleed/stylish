import 'package:ecommerce_project/Features/home/data/repos/products_repo.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/categories/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;
  CategoriesCubit({required this.homeRepo}) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final response = await homeRepo.getAllCategories();
    response.fold(
      (error) => emit(CategoriesError(errormessage: error.errorMessage)),
      (categories) => emit(CategoriesLoaded(categories: categories)),
    );
  }
}
