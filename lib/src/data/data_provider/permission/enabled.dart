bool _hasEnabledPermission = false;

class PermissionEnabledDataProvider {
  const PermissionEnabledDataProvider();

  bool get hasEnabledPermission => _hasEnabledPermission;

  set hasEnabledPermission(bool hasEnabledPermission) {
    if(_hasEnabledPermission == hasEnabledPermission){
      return;
    }
    _hasEnabledPermission = hasEnabledPermission;
  }
}
