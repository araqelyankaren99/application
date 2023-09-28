import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelImageWidget extends StatelessWidget {
  const CancelImageWidget({Key? key, this.width = 104}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/cancel.svg', width: width);
  }
}
