enum FromWho { me, hers }

class Message {
  final String text = "";
  final String imageUrl = "";
  final FromWho fromWho = FromWho.me;

  Message({required text, imageUrl, required fromWho});
}
