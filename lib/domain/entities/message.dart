import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

enum FromWho { me, hers }

class Message {
  String text = "";
  String imageUrl = "";
  FromWho fromWho = FromWho.me;

  Message({required this.text, imageUrl, required this.fromWho});


}
