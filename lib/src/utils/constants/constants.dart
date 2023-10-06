library constants;

import 'package:flutter/cupertino.dart';

const ipadHeight = 1080;
const ipadWidth = 810;

const activationIntervalDuration = Duration(seconds: 10);
const showTimerDuration =  Duration(seconds: 5);

double rw(BuildContext context) {
  return MediaQuery.of(context).size.width / ipadWidth;
}

double rh(BuildContext context) {
  return MediaQuery.of(context).size.height / ipadHeight;
}