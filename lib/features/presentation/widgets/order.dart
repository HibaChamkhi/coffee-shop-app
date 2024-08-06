import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool isDeliverSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 20.h),
            _buildSelectionButtons(),
            isDeliverSelected
                ? Container(
                    padding:  EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Delivery Address Section
                        Text('Delivery Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp)),
                        SizedBox(height: 8.h),
                        Text('Jl. Kpg Sutoyo', style: TextStyle(fontSize: 16.sp)),
                        const Text('Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai',
                            style: TextStyle(color: Colors.grey)),

                        Row(
                          children: [
                            TextButton(
                                onPressed: () {}, child: Text('Edit Address',style: TextStyle(color: Colors.black),)),
                            TextButton(
                                onPressed: () {}, child: Text('Add Note',style: TextStyle(color: Colors.black))),
                          ],
                        ),

                        Divider(),

                        // Order Item Section
                        ListTile(
                          leading: Image.asset('assets/CaffeMocha.png'), // Replace with actual image URL
                          title: Text('Caffe Mocha'),
                          subtitle: Text('Deep Foam'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove), onPressed: () {}),
                              Text('1'),
                              IconButton(
                                  icon: Icon(Icons.add), onPressed: () {}),
                            ],
                          ),
                        ),

                        // Discount Section
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                          margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:  Row(
                            children: [
                              const Icon(Icons.discount, color: Color(0xFFC67C4E)),
                              SizedBox(width: 8.w),
                              const Text('1 Discount is Applied'),
                            ],
                          ),
                        ),


                        // Payment Summary Section
                        Text('Payment Summary',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp)),
                        SizedBox(height: 8.h),

                        _buildSummaryRow('Price', '\$4.53'),
                        _buildSummaryRow('Delivery Fee', '\$2.00', isOriginalPrice: true),


                        // Payment Method Section
                        const ListTile(
                          leading: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Color(0xFFC67C4E),
                          ),
                          title: Text('Cash/Wallet'),
                          subtitle: Text(
                            '\$5.53',
                            style: TextStyle(color: Color(0xFFC67C4E)),
                          ),
                          trailing: Icon(Icons.arrow_drop_down),
                        ),


                        // Order Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              backgroundColor: Color(0xFFC67C4E),
                            ),
                            child: Text('Order',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon:  Icon(Icons.arrow_back_ios, size: 20.w),
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
      margin: EdgeInsets.symmetric(horizontal: 52.w),
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
          padding: EdgeInsets.symmetric(vertical: 5.h),
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
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
