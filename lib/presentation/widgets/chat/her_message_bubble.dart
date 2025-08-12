import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({
    super.key,
    required this.message,
  }); //: _index = index; //Inicializa _index

  

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(height: 5),
        _ImageBubble(message.imageUrl),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Image.network(
        //"https://yesno.wtf/assets/no/17-829284e9dd894ce9fb65fbe86d2e382c.gif",
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        //child es la Image a cargar.
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; //Si ya terminó, return la imagen
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('mi amor está enviando una imagen'),
          );
        },
      ),
    );
  }
}
