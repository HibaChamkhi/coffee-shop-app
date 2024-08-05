import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20.w, top: 60.h,right: 20.w),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios,size: 20,),
                  Text('Detail',style: TextStyle(fontWeight: FontWeight.bold),),
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
              margin:  EdgeInsets.symmetric(vertical: 20.0.w),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Image.asset(
                  'assets/CaffeMocha.png',
                  width: 340.w,
                  height: 202.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text('Caffe Mocha',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text('Description',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',style: TextStyle(),),
            Text('Size',style: TextStyle(fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
