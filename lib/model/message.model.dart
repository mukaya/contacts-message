class Message {
  int? id;
  int contactId;
  DateTime? date;
  String content;
  String type;
  bool selected = false;

  Message({
    this.id,
    required this.contactId,
    this.date,
    required this.content,
    required this.type,
    required this.selected,
  });
}
