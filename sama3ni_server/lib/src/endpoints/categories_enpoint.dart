import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoriesEndpoint extends Endpoint {
  Future<List<Category>> getCategories(Session session) async {
    return Category.db.find(session);
  }

  Future<Category> getCategoryById(Session session, int id) async {
    final category = await Category.db.findById(session, id);
    if (category == null) {
      throw AppException(
        message: 'Category not found',
        errorType: ExceptionType.notFound,
      );
    }
    return category;
  }
}
