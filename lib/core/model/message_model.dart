class Message {
  final String idFrom;
  final String idTo;
  final String content;
  final DateTime timestamp;
  final String type;

  Message({
    required this.idTo,
    required this.idFrom,
    required this.content,
    required this.timestamp,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        "idTo": idTo,
        "idFrom": idFrom,
        "content": content,
        "timestamp": timestamp.toIso8601String(),
        "type": type
      };

  factory Message.from(Map<String, dynamic> json) => Message(
        idTo: json['idTo'],
        idFrom: json['idFrom'],
        content: json['content'],
        type: json['type'],
        timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
      );
}
