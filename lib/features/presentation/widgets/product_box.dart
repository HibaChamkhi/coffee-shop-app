import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBox extends StatefulWidget {
  const ProductBox({super.key});

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: Image.asset(
              'assets/coffee.jpeg',
              width: 140.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Coffee Latte',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Deep Foam'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('\$ 4.53',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                         alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFC67C4E),
                      ),
                      height: 30.h,
                      width: 30.h,
                      child: const Text("+",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold ,
                              color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
