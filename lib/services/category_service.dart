import 'package:fixedfundsflow/model/category.dart';
import 'package:fixedfundsflow/services/database_service.dart';

class CategoryService {
  final DatabaseService _databaseService;

  CategoryService(this._databaseService);

  Future<int> addCategory(Category category) async {
    final db = await _databaseService.database;
    return await db.insert('categories', category.toMap());
  }

  Future<List<Category>> getCategories() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');

    return List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }

  Future<int> updateCategory(Category category) async {
    final db = await _databaseService.database;
    return await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await _databaseService.database;
    return await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
