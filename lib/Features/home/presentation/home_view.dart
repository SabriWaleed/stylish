import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/widgets/appbar_widget.dart';
import 'package:ecommerce_project/Core/widgets/row_sort_filter_widget.dart';
import 'package:ecommerce_project/Core/widgets/search_widget.dart';
import 'package:ecommerce_project/Features/home/data/models/category_model.dart';
import 'package:ecommerce_project/Features/home/data/models/product_model.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/categories/category_cubit.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/categories/category_state.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/producs/product_cubit.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/producs/product_state.dart';
import 'package:ecommerce_project/Features/home/presentation/widgets/grid_view_widget.dart';
import 'package:ecommerce_project/Features/home/presentation/widgets/rowcategorys_widget.dart';
import 'package:ecommerce_project/Features/home/presentation/widgets/stackimagehome_widget.dart';
import 'package:ecommerce_project/Features/home/presentation/widgets/timedaycontainer.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Products> allProducts = [];
  List<Category> allCategory = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();

    BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundTextField,
      appBar: AppbarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(16.w), child: SearchWidget()),
            SizedBox(height: 16.h),
            RowSortFilterWidget(),
            SizedBox(height: 16.h),
            BlocConsumer<CategoriesCubit, CategoriesState>(
              listener: (context, state) {
                if (state is CategoriesError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errormessage)));
                } else if (state is CategoriesLoaded) {
                  allCategory = (state).categories;
                }
              },
              builder: (BuildContext context, state) {
                if (state is CategoriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoriesError) {
                  return Center(child: Text(state.errormessage));
                } else if (state is CategoriesLoaded) {
                  if (state.categories.isEmpty) {
                    return const Center(child: Text('No Category Found'));
                  }
                  return RowcategorysWidget(allCategory: state.categories);
                } else {
                  return RowcategorysWidget(allCategory: allCategory);
                }
              },
            ),
            SizedBox(height: 24.h),
            StackimagehomeWidget(),
            SizedBox(height: 12.h),
            Image.asset(
              Assets.assetsImagesGrouppoints,
              width: 59.w,
              height: 19.h,
            ),
            Timedaycontainer(),
            BlocConsumer<ProductsCubit, ProductsState>(
              listener: (context, state) {
                if (state is ProductsError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errormessage)));
                } else if (state is ProductsLoaded) {
                  allProducts = (state).products;
                }
              },
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsError) {
                  return Center(child: Text(state.errormessage));
                } else if (state is ProductsLoaded) {
                  if (state.products.isEmpty) {
                    return const Center(child: Text('No Products Found'));
                  }
                  return GridViewWidget(allProducts: state.products);
                } else {
                  return GridViewWidget(allProducts: allProducts);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
