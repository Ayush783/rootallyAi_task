part of 'database_bloc.dart';

@immutable
abstract class DatabaseEvent {}

class GetSessions extends DatabaseEvent {
  final String userId;

  GetSessions(this.userId);
}
