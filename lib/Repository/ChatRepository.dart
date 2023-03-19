import '../Api/api.dart';

class ChatRepository {
  ///Fetch api login
  static Future<AnswerModel> requestChat({required QuestionModel pojo}) async {
    final response = await Api.requestChatGtp(pojo);
    return response;
  }
}