part of 'database_bloc.dart';

@immutable
abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class Fetching extends DatabaseState {}

class DatabaseFailure extends DatabaseState {
  final String error;

  DatabaseFailure(this.error);
}

class DatabaseSuccess extends DatabaseState {
  final List<Sessions> sessions;

  DatabaseSuccess(this.sessions);
}
