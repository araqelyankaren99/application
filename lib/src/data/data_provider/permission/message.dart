String _permissionMessage = '';

class PermissionMessageDataProvider {
  const PermissionMessageDataProvider();

  String get permissionMessage => _permissionMessage;

  set permissionMessage(String permissionMessage) {
    if(_permissionMessage == permissionMessage){
      return;
    }
    _permissionMessage = permissionMessage;
  }
}
