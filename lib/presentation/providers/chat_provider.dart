import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me), //Shift + Alt + arrow para duplicar arriba/abajo
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    if (text.endsWith('?')) {
      herReply();
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners(); // equivale a setState()
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final Message herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  //
  //void moveScrollToBottom() {
  //Agrego un Delay:
  Future<void> moveScrollToBottom() async {
    await Future.delayed(Duration(milliseconds: 200));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
