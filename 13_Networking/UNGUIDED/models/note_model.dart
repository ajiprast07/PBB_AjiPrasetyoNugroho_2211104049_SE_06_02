class Note {
  String id;
  String title;
  String description;
  DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
