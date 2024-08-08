import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: OSMViewer(
                  controller: SimpleMapController(
                    initPosition: GeoPoint(
                      latitude: 47.4358055,
                      longitude: 8.4737324,
                    ),
                    markerHome: const MarkerIcon(
                      icon: Icon(Icons.home),
                    ),
                  ),
                  zoomOption: const ZoomOption(
                    initZoom: 16,
                    minZoomLevel: 11,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomSheetContent();
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Show Delivery Info',
                        style: TextStyle(color: Colors.black)),
                    SizedBox(width: 10.w),
                    Icon(Icons.keyboard_arrow_up,
                        size: 20.0, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            left: 20.w,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50)),
              child: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pop(
                      context); // Navigates back to the previous screen
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomSheetContent() {
    return Padding(
      padding:  EdgeInsets.all(20.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50)),
            height: 3.h,
            width: 50.w,
          )),
           SizedBox(height: 10.h),
          const Text(
            '10 minutes left',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text('Delivery to Jl. Kpg Sutoyo'),
          _buildStepIndicator(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: ListTile(
              leading: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Image.asset("assets/deliverIcon.png")),
              title: Text('Delivered your order'),
              subtitle: Text(
                  'We will deliver your goods to you in the shortest possible time.'),
            ),
          ),
          ListTile(
            leading:  CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://example.com/path/to/image.jpg'), // Replace with your image URL
            ),
            title: Text('Brooklyn Simmons'),
            subtitle: Text('Personal Courier'),
            trailing: IconButton(
              icon: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Icon(Icons.call)),
              onPressed: () {
                // Add call functionality here
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStepRectangle(isCompleted: true),
          _buildStepRectangle(isCompleted: true),
          _buildStepRectangle(isCompleted: true),
          _buildStepRectangle(isCompleted: false),
        ],
      ),
    );
  }

  Widget _buildStepRectangle({required bool isCompleted}) {
    return Container(
      width: 60.0.w,
      height: 3.0.h,
      decoration: BoxDecoration(
        color: isCompleted ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
