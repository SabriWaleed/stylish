import 'package:ecommerce_project/Features/home/data/models/product_model.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading
    extends ProductsState {} //دي كدا انا هستخدمها مع اول فيتش بس ال هو اول كاال

class ProductPagenationLoading
    extends
        ProductsState // دي كدا انا هستخدمها مع كل مره اوصل للاوفست الجديد علشان تجيب داتا جديده
        {
  final List<Products>
  currentProducts; // دي البرودكت الموجوده عندي والباجينيشن جاي علشان علشان يجيب برودكت جديده  واقوم ضايفها عليها فاتبقا الليستته فيها القديمه والجديده
  ProductPagenationLoading({required this.currentProducts});
}

class ProductsLoaded extends ProductsState {
  // دي ال بتتنده لما تكون الداتا جات سواء اول فيتش او مع كل مره بعمل فيها باجينيشن
  final List<Products>
  products; // تعبر عن كل البرودكتس سواء القديمه او الجديده ال هي اول فيتش او ال جات بعد كدا مع الباجينيشن
  final bool
  hasMore; // ده ال انا بتشيك عليه علشان اشوف الايتمز ال جات في الفيتش ده اقل من الليميت ولا علشان لو اقل من الليميت يبقا كدا معتش داتا
  ProductsLoaded({required this.products, required this.hasMore});
}

class ProductsError extends ProductsState {
  // هتتنده بس في الفيتش الاولاني من الصفحه لو حصل ايرور اثناء اول فيتش بس ملهاش علاقه بالداتا بتاعه الباجينيشت لسا
  final String errormessage;
  ProductsError({required this.errormessage});
}

class ProductPagenationFailure {
  // دي علشان لو حصل ايرور وانا بعمل اسكرول علشان اجيب داتا جديده اثناء الباجينيشن
  final String errormessage;// دي رساله الايرور ال تظهرله
  final List<Products> currentProducts;// انه حتى لو حصل ايرور يفضل محتفظ بالبرودكت القديمه ال كانت موجوده
  ProductPagenationFailure({
    required this.errormessage,
    required this.currentProducts,
  });
}
