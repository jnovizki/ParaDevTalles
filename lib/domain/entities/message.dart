enum FromWho { me, hers }

class Message {
  String text = "";
  String imageUrl = "";
  FromWho fromWho = FromWho.me;

  Message({required this.text, imageUrl, required this.fromWho});
}
