import 'package:firebase_database/firebase_database.dart';
import 'package:rootallyai_task/models/sessions.dart';

class DatabaseService {
  static final _database = FirebaseDatabase.instance.reference().child('users');
  Future<SessionList> getSessions(String userId) async {
    try {
      final snapshot = await _database.child(userId).get();
      final data =
          List.from(snapshot.value).map((e) => Sessions.fromJson(e)).toList();
      return SessionList.success(data);
      // _service.getSessions('ZvivlLcROdVhXF3XPZMT1ctLvJt2');
    } catch (e) {
      print(e.toString());
      return SessionList.failure(e.toString());
    }
  }
}
