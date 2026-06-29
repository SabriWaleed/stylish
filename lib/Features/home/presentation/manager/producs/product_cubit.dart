import 'package:ecommerce_project/Features/home/data/models/product_model.dart';
import 'package:ecommerce_project/Features/home/data/repos/products_repo.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/producs/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;
  ProductsCubit({required this.homeRepo}) : super(ProductsInitial());
  static const int _limit = 10;
  int _offset = 0;
  bool _hasMore = true;
  bool _isFetching = false;
  final List<Products> _products =
      []; // دي الليسته اللوكال ال هضيف فيها الداتا ال هتجيلي كل شويه مع كل فيتش وفي الاخر هعرضها عندي في اليو اي علشان لو حصل ايرور وقت الباجينيشن متختفيش الداتا
  Future<void> getProducts() async {
    if (_isFetching) return;
    _reset(); // علشان ارجع كل حاجه زي ماهي لما اجي اعمل فيتش جديد لاول مره
    // if (isClosed) return;

    emit(ProductsLoading());
    final response = await homeRepo.getAllProducts(
      offset: _offset,
      limit: _limit,
    );

    // if (isClosed) return;
    response.fold(
      (error) => emit(ProductsError(errormessage: error.errorMessage)),
      (newProducts) {
        _products.addAll(newProducts);
        _hasMore = newProducts.length == _limit;
        _offset += newProducts.length;
        emit(ProductsLoaded(products: List.from(_products), hasMore: _hasMore));
      },
    );
    _isFetching = false;
  }

  Future<void> getMoreProducts() async {
    if (_isFetching || !_hasMore) return;
    _isFetching = true;
    emit(ProductPagenationLoading(currentProducts: List.from(_products)));
    final result = await homeRepo.getAllProducts(
      offset: _offset,
      limit: _limit,
    );
    result.fold(
      (error) => emit(
        ProductPagenationFailure(
              errormessage: error.errorMessage,
              currentProducts: List.from(_products),
            )
            as ProductsState,
      ),
      (newProducts) {
        _products.addAll(newProducts);
        _hasMore = newProducts.length == _limit;
        _offset += newProducts.length;
        emit(ProductsLoaded(products: List.from(_products), hasMore: _hasMore));
      },
    );
    _isFetching = false;
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
      (products) => emit(
        ProductsLoaded(products: List.from(products), hasMore: _hasMore),
      ),
    );
  }

  void _reset() {
    _offset = 0;
    _hasMore = true;
    _isFetching = true;
    _products.clear();
  }
}
