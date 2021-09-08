class Message {
  int id;
  int contactId;
  DateTime date;
  String content;
  String type;

  Message({
    required this.id,
    required this.contactId,
    required this.date,
    required this.content,
    required this.type,
  });
}
