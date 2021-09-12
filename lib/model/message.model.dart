class Message {
  int? id;
  int contactId;
  DateTime? date;
  String content;
  String type;

  Message({
    this.id,
    required this.contactId,
    this.date,
    required this.content,
    required this.type,
  });
}
