import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    //throw UnimplementedError();
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //return Message(text: response.data["answer"], fromWho: FromWho.hers, imageUrl: response.data["image"]);
    //return Message(text: yesNoModel.answer, imageUrl: yesNoModel.image, fromWho: FromWho.hers);
    return yesNoModel.toMessageEntity();
  }
}
