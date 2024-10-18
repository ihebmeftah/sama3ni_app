import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskEndpoint extends Endpoint {
  Future<List<Tasks>> getTasks(Session session) async {
    return Tasks.db.find(session);
  }

  Future<Tasks> createTask(Session session, Tasks task) async {
    try {
      final createdTask = await Tasks.db.insertRow(session, task);
      return createdTask;
    } catch (e) {
      session.log(e.toString());
      throw Exception('Failed to create task: $e');
    }
  }
}
