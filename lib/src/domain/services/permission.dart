import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  const PermissionService();

  Future<String> permissionMessage() async {
    var permissionMessage = '';
    final hasMicrophonePermission = await Permission.microphone.request();
    final hasCameraPermission = await Permission.camera.request();

    if (!hasMicrophonePermission.isGranted) {
      permissionMessage += '\n Please Enable Microphone';
    }

    if (!hasCameraPermission.isGranted) {
      permissionMessage += '\n Please Enable Camera';
    }

    if(permissionMessage.isEmpty){
      return permissionMessage;
    }

    return 'Need permission\n $permissionMessage';
  }

  Future<bool> hasEnabledPermission () async{
    final message = await permissionMessage();
    return message.isEmpty;
  }

  Future<void> openSettings () async {
    await openAppSettings();
  }
}
