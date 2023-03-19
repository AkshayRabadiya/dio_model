import '../Api/api.dart';

class CategoryRepository {
  ///Load Category
  static Future<CategoryModel> loadCategory({
    required String token,
    required String deviceToken,
    required String cityId
  }) async {
    Map<String, dynamic> headers = {
      "Authorization": token,
    };
    Map<String, dynamic> params = {
      "dt": deviceToken,
      "Cityid":cityId,
    };
    final response = await Api.requestCategory(headers, params);
    return response;
  }
}
