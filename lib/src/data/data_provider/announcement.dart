import 'package:application/src/domain/entity/network/announcement.dart';
import 'package:application/src/domain/services/collection.dart';

List<Announcement> _announcements = [];

class AnnouncementDataProvider {
  const AnnouncementDataProvider();

  static const _collectionService = CollectionService();

  List<Announcement> get announcements => _announcements;

  set announcements(List<Announcement> announcements) {
    if (_collectionService.isIdenticalLists(announcements, _announcements)) {
      return;
    }
    _announcements = announcements;
  }
}
