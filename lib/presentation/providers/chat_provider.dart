import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola amor!',  fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?',  fromWho: FromWho.me),
    Message(text: 'Hola amor!',  fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?',  fromWho: FromWho.me)         //Shift + Alt + arrow para duplicar arriba/abajo
  ];

  Future<void> sendMessage(String text) async{
    //TODO Implementar método
  }
}
