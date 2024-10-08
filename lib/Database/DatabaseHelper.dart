import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app_getx/reuse_order/item_order.dart'; // Import OrderItem

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('orders.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, filePath),
      onCreate: _createDB,
      version: 1,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute(''' 
      CREATE TABLE orders(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        image TEXT,
        price TEXT,
        quantity INTEGER,
        status TEXT
      )
    ''');
  }

  Future<int> addOrder(OrderItem order) async {
    final db = await database;
    return await db.insert('orders', order.toMap());
  }

  Future<List<OrderItem>> getOrders() async {
    final db = await database;
    final result = await db.query('orders');
    return result.map((json) => OrderItem.fromMap(json)).toList();
  }

  Future<int> deleteOrder(int id) async {
    final db = await database;
    return await db.delete('orders', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearOrders() async {
    final db = await database;
    await db.delete('orders');
  }
}
