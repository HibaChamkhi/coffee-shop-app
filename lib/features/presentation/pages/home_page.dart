import 'package:coffe_shop/features/presentation/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../injection.dart';
import '../bloc/product_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductBloc>()..add(GetCategoriesEvent())..add(GetProductsEvent()),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.productStatus == ProductStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.messages),
              ),
            );
          }
          else if (state.productStatus == ProductStatus.loading) {
            Center(
              child: SizedBox(
                height: 60.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFC67C4E),
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          print(state.products);
          return   HomeWidget(categories:state.categories,products:state.products);
        });
  }

// Future<void> _onRefresh(BuildContext context) async {
//   BlocProvider.of<ProductBloc>(context)
//       .add(const GetAllProductsEvent());
// }
}
