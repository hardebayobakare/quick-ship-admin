import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';

class CustomLoaderAnimation extends StatelessWidget {
  const CustomLoaderAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(CustomImages.dataProcess, height: 200, width: 200),
    );
  }
}