import 'package:ecommerce_project/Features/home/presentation/manager/producs/product_cubit.dart';
import 'package:ecommerce_project/Features/home/presentation/manager/producs/product_state.dart';
import 'package:ecommerce_project/Features/home/presentation/widgets/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.categoryId.trim().isNotEmpty) {
        context.read<ProductsCubit>().getProductsByCategory(
          categoryId: widget.categoryId,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is ProductsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errormessage)));
          }
        },
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductsLoaded) {
            if (state.products.isEmpty) {
              return const Center(child: Text('No Products Found'));
            }
            return GridViewWidget(allProducts: state.products);
          }

          return const Center(child: Text("Select Category"));
        },
      ),
    );
  }
}
