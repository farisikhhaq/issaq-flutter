import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:issaq_pro/model/wishlist_model.dart';

class WishlistDatabase {
  static final WishlistDatabase instance = WishlistDatabase._init();

  static Database? _database;

  WishlistDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('wishlist.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableWishlist ( 
  ${WishlistFields.id} $idType,
  ${WishlistFields.isImportant} $boolType,
  ${WishlistFields.number} $integerType,
  ${WishlistFields.title} $textType,
  ${WishlistFields.description} $textType,
  ${WishlistFields.time} $textType
  )
''');
  }

  Future<Wishlist> create(Wishlist wishlist) async {
    final db = await instance.database;

    final id = await db.insert(tableWishlist, wishlist.toJson());
    return wishlist.copy(id: id);
  }

  Future<Wishlist> readWishlist(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableWishlist,
      columns: WishlistFields.values,
      where: '${WishlistFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Wishlist.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Wishlist>> readAllWishlists() async {
    final db = await instance.database;

    final orderBy = '${WishlistFields.time} ASC';

    final result = await db.query(tableWishlist, orderBy: orderBy);

    return result.map((json) => Wishlist.fromJson(json)).toList();
  }

  Future<int> update(Wishlist wishlist) async {
    final db = await instance.database;

    return db.update(
      tableWishlist,
      wishlist.toJson(),
      where: '${WishlistFields.id} = ?',
      whereArgs: [wishlist.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableWishlist,
      where: '${WishlistFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
