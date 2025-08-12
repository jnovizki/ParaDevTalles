// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);
//Para petición a API:  https://yesno.wtf/api . Se obtiene respuesta con Postman.
//Lo que sigue lo genera el llamado a https://app.quicktype.io/ => <código> y se pega en este .dart, usando
// la extensión instalada "Paste JSON as Code"

import 'package:yes_no_app/domain/entities/message.dart';

//Si se recibe un String, lo transforma a Map
//YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJson(json.decode(str));
//Para enviar a peticion http:
//String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) =>
      YesNoModel(answer: json["answer"], forced: json["forced"], image: json["image"]);

  Map<String, dynamic> toJson() => {"answer": answer, "forced": forced, "image": image};

  Message toMessageEntity() => Message(text: (answer == "yes" ? "Si" : "No"), fromWho: FromWho.hers, imageUrl: image);

}
