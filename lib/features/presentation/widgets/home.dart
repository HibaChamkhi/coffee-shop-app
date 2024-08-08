import 'package:coffe_shop/features/data/models/product_model.dart';
import 'package:coffe_shop/features/presentation/widgets/product_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/category_model.dart';

enum SelectedTab { home, favorite, add, search, person }

final List<String> coffeeNames = [
  "All Coffee",
  "Espresso",
  "Americano",
  "Latte",
  "Cappuccino",
  "Mocha",
  "Macchiato",
  "Flat White",
  "Affogato",
  "Cortado",
  "Irish Coffee"
];

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.categories, required this.products}) : super(key: key);

final List<CategoryModel> categories ;
final List<ProductModel> products ;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  SelectedTab _selectedTab = SelectedTab.home;
  int _selectedIndex = 0;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = SelectedTab.values[index];
    });
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                _buildHeader(),
                _buildCoffeeList(),
                _buildCoffeeGrid(),
              ],
            ),
          ),
          _buildOverlay()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 300.h,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Location", style: TextStyle(color: Colors.white)),
            SizedBox(height: 10.h),
            const Text("Hammem Soussa, Soussa",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            Row(
              children: [
                _buildSearchField(),
                SizedBox(
                  width: 10.w,
                ),
                _buildMenuButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.white, size: 20.w),
          fillColor: Colors.grey[900],
          filled: true,
          hintText: "Search by Name",
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          isDense: true,
        ),
        style: TextStyle(fontSize: 14.0.sp, color: Colors.white),
      ),
    );
  }


  Widget _buildMenuButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFC67C4E),
      ),
      height: 48.w,
      width: 48.w,
      child: const Icon(Icons.menu, color: Colors.white),
    );
  }

  Widget _buildCoffeeList() {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(top: 100.h, left: 20.w, bottom: 5.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Adding the "All" category at the beginning
          GestureDetector(
            onTap: () => _onItemTap(0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: _selectedIndex == 0
                    ? const Color(0xFFC67C4E)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "All",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: _selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Mapping the other categories, starting index from 1
          ...widget.categories.asMap().entries.map((entry) {
            int index = entry.key + 1;
            String name = entry.value.name;
            return GestureDetector(
              onTap: () => _onItemTap(index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: _selectedIndex == index
                      ? const Color(0xFFC67C4E)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color:
                      _selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );

  }

  Widget _buildCoffeeGrid() {
    return Container(
      height: 500.h,
      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 120),
      child: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 0.75
        ),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return  ProductBox(product: widget.products[index]);
        },
      ),
    );
  }

  Widget _buildOverlay() {
    return Stack(
      children: [
        Positioned(
          top: 240.h,
          left: 25.w,
          right: 25.w,
          child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFC9A891),
                borderRadius: BorderRadius.circular(8),
              ),
              width: 310.w,
              height: 140.h),
        ),
        Positioned(
          top: 260.h,
          left: 45.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Promo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: 235.h,
          left: 45.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 200.w,
                child: Text(
                  'Buy one get one FREE',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Image.asset(
                'assets/promo.png',
                width: 130.w,
                height: 140.h,
                fit: BoxFit.fill,
              ),
            ],
          ),
        )
      ],
    );
  }
}

