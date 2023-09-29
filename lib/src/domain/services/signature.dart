import 'dart:convert';
import 'dart:ui';

import 'package:image/image.dart' as image;
import 'package:signature/signature.dart';

class SignatureService {
  const SignatureService();

  Future<String?> signatureBase64String(
    SignatureController signatureController,
  ) async {
    final signature = await signatureController.toImage();
    final pngBytes = await signature?.toByteData(format: ImageByteFormat.png);
    final uInt8list = pngBytes?.buffer
        .asUint8List(pngBytes.offsetInBytes, pngBytes.lengthInBytes);
    if (uInt8list != null) {
      final pngAsUiImage = image.decodeImage(uInt8list);
      if (pngAsUiImage != null) {
        final base64 = base64Encode(image.encodeJpg(pngAsUiImage));
        return base64;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
