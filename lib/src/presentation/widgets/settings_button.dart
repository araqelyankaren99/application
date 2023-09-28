import 'package:application/src/domain/services/permission.dart';
import 'package:application/src/presentation/widgets/cancel_image.dart';
import 'package:application/src/utils/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  static const _permissionService = PermissionService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 45 * rh(context)),
      child: GestureDetector(
        onTap: _onTap,
        child: ColoredBox(
          color: const Color(0xFF2B619D),
          child: SizedBox(
            height: 160 * rh(context),
            child: const Row(
              children: [_CancelImageWidget(), _ButtonTextWidget()],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    _permissionService.openSettings();
  }
}

class _CancelImageWidget extends StatelessWidget {
  const _CancelImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 33 * rw(context)),
      child: CancelImageWidget(width: 104 * rw(context)),
    );
  }
}

class _ButtonTextWidget extends StatelessWidget {
  const _ButtonTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 46 * rw(context)),
      child: Expanded(
        child: AutoSizeText(
          'Open app settings',
          maxFontSize: 50,
          minFontSize: 16,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 50 * rw(context),
              color: Colors.white,),
        ),
      ),
    );
  }
}
