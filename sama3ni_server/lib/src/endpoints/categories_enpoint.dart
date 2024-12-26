import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoriesEndpoint extends Endpoint {
  Future<List<Category>> getCategories(Session session) async {
    return Category.db.find(session);
  }
}
