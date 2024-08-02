import 'package:coffe_shop/features/presentation/widgets/product_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      // Uncomment and configure this if needed
      // bottomNavigationBar: CrystalNavigationBar(
      //   borderRadius: 0,
      //   boxShadow: const [
      //     BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 250, offset: Offset(0, -300)),
      //   ],
      //   currentIndex: SelectedTab.values.indexOf(_selectedTab),
      //   height: 0,
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: Colors.white,
      //   onTap: _handleIndexChanged,
      //   items: [
      //     CrystalNavigationBarItem(icon: Icons.home, unselectedIcon: Icons.home, selectedColor: Color(0xFFC67C4E)),
      //     CrystalNavigationBarItem(icon: Icons.monitor_heart, unselectedIcon: Icons.monitor_heart, selectedColor: Color(0xFFC67C4E)),
      //     CrystalNavigationBarItem(icon: Icons.shopping_bag_outlined, unselectedIcon: Icons.shopping_bag_outlined, selectedColor: Color(0xFFC67C4E)),
      //     CrystalNavigationBarItem(icon: Icons.notifications, unselectedIcon: Icons.notifications, selectedColor: Color(0xFFC67C4E)),
      //   ],
      // ),
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
          border: InputBorder.none,
          prefixIcon:  Icon(Icons.search, color: Colors.white, size: 20.w),
          fillColor: Colors.grey[900],
          filled: true,
          hintText: "Search by Name",
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
               EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          isDense: true,
        ),
        style:  TextStyle(fontSize: 14.0.sp, color: Colors.white),
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
      margin: EdgeInsets.only(top: 100.h, left: 20.w),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: coffeeNames.asMap().entries.map((entry) {
          int index = entry.key;
          String name = entry.value;
          return GestureDetector(
            onTap: () => _onItemTap(index),
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              margin:  EdgeInsets.symmetric(horizontal: 10.w),
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
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color:
                        _selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCoffeeGrid() {
    return Container(
      height: 500.h,
      padding:  EdgeInsets.all(8.0.w),
      child: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: coffeeNames.length,
        itemBuilder: (context, index) {
          return const ProductBox();
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
          top: 245.h,
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
                width: 180.w,
                child: Text(
                  'Buy one get one FREE',
                  style: TextStyle(
                    fontSize: 22.sp,
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
