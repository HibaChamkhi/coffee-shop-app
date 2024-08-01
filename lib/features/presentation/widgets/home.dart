import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

enum SelectedTab { home, favorite, add, search, person }

final List<String> coffeeNames = [
  "All Coffee", "Espresso", "Americano", "Latte", "Cappuccino",
  "Mocha", "Macchiato", "Flat White", "Affogato", "Cortado", "Irish Coffee"
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
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              _buildCoffeeList(),
              _buildCoffeeGrid(),
            ],
          ),
          _buildOverlay(),
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
      height: 300,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Location", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            const Text("Hammem Soussa, Soussa",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildSearchField(),
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
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.white, size: 20),
          fillColor: Colors.grey[900],
          filled: true,
          hintText: "Search by Name",
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          isDense: true,
        ),
        style: const TextStyle(fontSize: 14.0, color: Colors.white),
      ),
    );
  }

  Widget _buildMenuButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFC67C4E),
      ),
      height: 50,
      width: 50,
      child: const Icon(Icons.menu, color: Colors.white),
    );
  }

  Widget _buildCoffeeList() {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: 100.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: coffeeNames.asMap().entries.map((entry) {
          int index = entry.key;
          String name = entry.value;
          return GestureDetector(
            onTap: () => _onItemTap(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: _selectedIndex == index ? const Color(0xFFC67C4E) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 10,
                    color: _selectedIndex == index ? Colors.white : Colors.black,
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
      height: 400,
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: coffeeNames.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverlay() {
    return Positioned(
      top: 230,
      left: 25,
      right: 25,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFC9A891),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 310,
        height: 140,
      ),
    );
  }
}
