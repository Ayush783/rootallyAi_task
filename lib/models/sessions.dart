// a model for individual session
class Sessions {
  final String title;
  final bool isCompleted;
  final DateTime performedAt;

  Sessions(
    this.title,
    this.isCompleted,
    this.performedAt,
  );

  Sessions.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        isCompleted = json["isCompleted"],
        performedAt = DateTime.parse(json["performedAt"]);
}

//a model for list of sessions from database
class SessionList {
  final List<Sessions> sessions;
  final String errorMessage;
  final bool error;

  SessionList(this.sessions, this.errorMessage, this.error);

  SessionList.success(List<Sessions> sessions)
      : sessions = sessions,
        error = false,
        errorMessage = 'none';

  SessionList.failure(String errorMessage)
      : error = true,
        errorMessage = errorMessage,
        sessions = List.empty();
}
