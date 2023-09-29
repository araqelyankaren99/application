import 'package:application/src/presentation/widgets/dialog_text_widget.dart';
import 'package:application/src/presentation/widgets/internet_image.dart';
import 'package:application/src/utils/constants/constants.dart';
import 'package:flutter/material.dart';

void showInternetDialog(BuildContext context) {
  showDialog(
    useSafeArea: false,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        shape: const RoundedRectangleBorder(),
        insetPadding: EdgeInsets.zero,
        elevation: 0,
        backgroundColor: const Color(0xFFC6EBFF).withOpacity(0.8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 47 * rw(context)),
          child: const _InternetMessageBody(),
        ),
      );
    },
  );
}

class _InternetMessageBody extends StatelessWidget {
  const _InternetMessageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1432 / 1153,
          child: ColoredBox(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _InternetImage(),
                _TextWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void hideInternetDialog(BuildContext context) {
  Navigator.of(context).pop();
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DialogTextWidget(
      padding: EdgeInsets.zero,
      color: Color(0xFF666666),
      fontWeight: FontWeight.w500,
      text:
          'Internet connection lost please wait a few minutes or call the assistant',
    );
  }
}

class _InternetImage extends StatelessWidget {
  const _InternetImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InternetImage(
      height: 104 * rh(context),
    );
  }
}
