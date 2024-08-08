import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'delivery_screen.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool isDeliverSelected = true;
  int _quantity = 1;
  bool _isPaymentVisible = true;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  void _togglePaymentVisibility() {
    setState(() {
      _isPaymentVisible = !_isPaymentVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 35.w,
        ),
        height: _isPaymentVisible ? 200.h : 100.h,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet_outlined,
                color: Color(0xFFC67C4E),
              ),
              title: const Text('Cash/Wallet'),
              subtitle: _isPaymentVisible
                  ? const Text(
                '\$5.53',
                style: TextStyle(color: Color(0xFFC67C4E)),
              )
                  : null,
              trailing: IconButton(
                icon: Icon(
                  _isPaymentVisible
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up,
                ),
                onPressed: _togglePaymentVisibility,
              ),
            ),
            Visibility(
              visible: _isPaymentVisible,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DeliveryScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: const Color(0xFFC67C4E),
                  ),
                  child: Text('Order',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 60.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: 20.h),
              _buildSelectionButtons(),
              isDeliverSelected
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delivery Address Section
                  Text('Delivery Address',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp)),
                  SizedBox(height: 8.h),
                  Text('Jl. Kpg Sutoyo',
                      style: TextStyle(fontSize: 16.sp)),
                  const Text('Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai',
                      style: TextStyle(color: Colors.grey)),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(25),
                                    border:
                                    Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit_note_outlined,
                                      size: 15,
                                      color: Colors.grey[700],
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('Edit Address',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 14.sp)),
                                  ],
                                ))),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(25),
                                    border:
                                    Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.list_alt_sharp,
                                      size: 15,
                                      color: Colors.grey[700],
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text('Add Note',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 14.sp)),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset('assets/CaffeMocha.png',
                        width: 80.w),
                    title: const Text(
                      'Caffe Mocha',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Deep Foam'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: const Icon(Icons.remove, size: 20),
                          ),
                          onTap: _decrementQuantity,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0.w),
                          child: Text(
                            '$_quantity',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: const Icon(Icons.add, size: 20),
                          ),
                          onTap: _incrementQuantity,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 13.h, horizontal: 15.w),
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.3)),
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.discount,
                                color: Color(0xFFC67C4E)),
                            SizedBox(width: 10.w),
                            const Text('1 Discount is Applied'),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  Text('Payment Summary',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp)),
                  SizedBox(height: 8.h),
                  _buildSummaryRow('Price', '\$4.53'),
                  _buildSummaryRow('Delivery Fee', '\$2.00',
                      isOriginalPrice: true),
                ],
              )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, size: 20.w),
          ),
          const Text(
            'Order',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20.w), // Keeping space for alignment
        ],
      ),
    );
  }

  Widget _buildSelectionButtons() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildSelectionButton(
            label: 'Deliver',
            isSelected: isDeliverSelected,
            onTap: () {
              setState(() {
                isDeliverSelected = true;
              });
            },
          ),
          _buildSelectionButton(
            label: 'Pick Up',
            isSelected: !isDeliverSelected,
            onTap: () {
              setState(() {
                isDeliverSelected = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFC67C4E) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isOriginalPrice = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        if (isOriginalPrice)
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 8.w),
            ],
          ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
