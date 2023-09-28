library constants;

import 'package:flutter/cupertino.dart';

const ipadHeight = 1080;
const ipadWidth = 810;

double rw(BuildContext context) {
  return MediaQuery.of(context).size.width / ipadWidth;
}

double rh(BuildContext context) {
  return MediaQuery.of(context).size.height / ipadHeight;
}