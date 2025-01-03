import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoriesEndpoint extends Endpoint {
  Future<List<Category>> getCategories(Session session) async {
    return Category.db.find(session);
  }

  /// Get the top 5 categories, sorted by their name in ascending order.
  Future<List<Category>> getTopCategories(Session session) async {
    return Category.db.find(
      session,
      limit: 5,
    );
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
