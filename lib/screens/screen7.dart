// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sagar_sandwichss/pages/page2.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/page1.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import 'menu.dart';

class Indicate extends ConsumerWidget {
  Indicate({Key? key}) : super(key: key);
  final _controller = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandwich & cafe',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(),
            child: PageView(
              controller: _controller,
              children: [
                const Page1(),
                const Page2(),
                const Page3(),
                const Page4(),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(controller: _controller, count: 4),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: const Homepage(),
            ),
          ),
        ],
      ),
    );
  }
}
