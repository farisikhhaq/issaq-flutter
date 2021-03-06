final String tableWishlist = 'wishlist';

class WishlistFields {
  static final List<String> values = [
    id,
    isImportant,
    number,
    title,
    description,
    time
  ];
  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Wishlist {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Wishlist({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Wishlist copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Wishlist(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Wishlist fromJson(Map<String, Object?> json) => Wishlist(
        id: json[WishlistFields.id] as int?,
        isImportant: json[WishlistFields.isImportant] == 1,
        number: json[WishlistFields.number] as int,
        title: json[WishlistFields.title] as String,
        description: json[WishlistFields.description] as String,
        createdTime: DateTime.parse(json[WishlistFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        WishlistFields.id: id,
        WishlistFields.title: title,
        WishlistFields.isImportant: isImportant ? 1 : 0,
        WishlistFields.number: number,
        WishlistFields.description: description,
        WishlistFields.time: createdTime.toIso8601String(),
      };
}
