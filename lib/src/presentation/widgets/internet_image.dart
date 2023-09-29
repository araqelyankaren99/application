import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InternetImage extends StatelessWidget {
  const InternetImage({Key? key,this.height = 104}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/internet.svg',
      height: height,
    );
  }
}
