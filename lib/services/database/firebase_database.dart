import 'package:firebase_database/firebase_database.dart';
import 'package:rootallyai_task/models/sessions.dart';

//service for communicating with database
class DatabaseService {
  static final _database = FirebaseDatabase.instance.reference().child('users');
  Future<SessionList> getSessions(String userId) async {
    try {
      final snapshot = await _database
          .child('ZvivlLcROdVhXF3XPZMT1ctLvJt2')
          .get(); // hardcoded user id
      final data = List.from(snapshot.value).map((e) {
        final Map<String, dynamic> json = Map<String, dynamic>.from(e);
        return Sessions.fromJson(json);
      }).toList();
      return SessionList.success(data);
    } catch (e) {
      return SessionList.failure(e.toString());
    }
  }
}
