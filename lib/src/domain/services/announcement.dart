import 'package:application/src/data/data_provider/announcement.dart';
import 'package:application/src/domain/entity/network/announcement.dart';

class AnnouncementService {
  const AnnouncementService();

  static const _announcementDataProvider = AnnouncementDataProvider();

  void saveAnnouncements(List<Announcement> announcements) {
    _announcementDataProvider.announcements = announcements;
  }

  void removePatientInfo() {
    _announcementDataProvider.announcements.clear();
  }
}
