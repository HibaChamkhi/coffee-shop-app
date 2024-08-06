import 'package:coffe_shop/features/presentation/widgets/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = "S";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20.w, top: 60.h, right: 20.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'Detail',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/Icon.png',
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20.0.w),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Image.asset(
                  'assets/CaffeMocha.png',
                  width: 390.w,
                  height: 202.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
             Text(
              'Caffe Mocha',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Ice/Hot",style: TextStyle(color: Colors.grey),),
            ),
            Row(
              children: [
                Icon(Icons.star,size: 15,color: Colors.yellow[600],),
                const Text("4.8",style: TextStyle(fontWeight: FontWeight.bold),),
                const Text("(230)",style: TextStyle(color: Colors.grey),),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(),
            ),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'Read More',
                      style: TextStyle(color: Color(0xFFC67C4E)),
                    ),
                  ],
                ),
              ),
            ),

            const Text(
              'Size',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              color: Colors.transparent,
              child: Flexible(
                child: Center(
                  child: Container(
                    height: 35.h, // Set the desired height here
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: ["L", "M", "S"].map((size) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size; // Update selected size
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: selectedSize == size
                                  ? Color(0xFFC67C4E)
                                  : Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              size,
                              style: TextStyle(
                                color: selectedSize == size
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Text(
                      '\$4.45',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC67C4E)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60.w,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Order(),
                      ),
                    );                      },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC67C4E),
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
