import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rootallyai_task/models/sessions.dart';
import 'package:rootallyai_task/services/database/firebase_database.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseService _databaseService = DatabaseService();
  DatabaseBloc() : super(DatabaseInitial()) {
    on<DatabaseEvent>((event, emit) async {
      if (event is GetSessions) {
        emit(Fetching());
        final sessionOrError = await _databaseService.getSessions(event.userId);
        if (sessionOrError.error)
          emit(DatabaseFailure(sessionOrError.errorMessage));
        else
          emit(DatabaseSuccess(sessionOrError.sessions));
      }
    });
  }
}
