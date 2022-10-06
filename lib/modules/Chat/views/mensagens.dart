import 'package:ijob_app/modules/Chat/views/userChat.dart';

class Message {
  final User sender;
  final String time;
  final String text;

  Message({
    required this.sender,
    required this.time,
    required this.text,
  });
}

// Chat da Tela principal
List<Message> chats = [
  Message(
    sender: user1,
    time: '22:30',
    text: 'Claro, consigo sim',
  ),
  Message(
    sender: user2,
    time: '12:34',
    text: 'Limpa piscina também?',
  ),
  Message(
    sender: user3,
    time: '9:00',
    text: 'Enviado',
  ),
];

// chat das conversas
List<Message> messages = [
  Message(
    sender: user1,
    time: '22:30',
    text: 'Claro, consigo sim',
  ),
  Message(
    sender: currentUser,
    time: '21:30',
    text:
        'Consegue me atender as 7 da manhã?, quero chegar cedo para ter mais tempo para fazer o serviço',
  ),
  Message(
    sender: user1,
    time: '21:15',
    text: 'OK',
  ),
  Message(
    sender: currentUser,
    time: '20:30',
    text: 'Vou testar hoje o equipamento e amanhã cedo eu chego na sua casa',
  ),
  Message(
    sender: currentUser,
    time: '20:30',
    text: 'Tudo bem, e você?',
  ),
  Message(
    sender: user1,
    time: '19:00',
    text: 'Oi tudo bem?',
  ),
];
