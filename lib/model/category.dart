class Category {
  int id;
  String description;

  Category({required this.id, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      description: map['description'] as String,
    );
  }
}
