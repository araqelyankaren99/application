import 'package:application/src/presentation/widgets/dialog_text_widget.dart';
import 'package:application/src/presentation/widgets/settings_button.dart';
import 'package:application/src/presentation/widgets/warning_image.dart';
import 'package:application/src/utils/constants/constants.dart';
import 'package:flutter/material.dart';

void showPermissionDialog(BuildContext context,
    {required String permissionMessage,}) {

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
          child: Stack(
            alignment: Alignment.center,
            children: [
              _PermissionMessageBody(permissionMessage: permissionMessage),
              const _SettingsButton(),
            ],
          ),
        ),
      );
    },
  );
}

void hidePermissionDialog(BuildContext context) {
  Navigator.of(context).pop();
}

class _PermissionMessageBody extends StatelessWidget {
  const _PermissionMessageBody({
    Key? key,
    required this.permissionMessage,
  }) : super(key: key);

  final String permissionMessage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1432 / 1153,
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _WarningImage(),
            DialogTextWidget(text: permissionMessage),
          ],
        ),
      ),
    );
  }
}

class _WarningImage extends StatelessWidget {
  const _WarningImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WarningImage(
      width: 100 * rw(context),
    );
  }
}


class _SettingsButton extends StatelessWidget {
  const _SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: SettingsButton(),
    );
  }
}
