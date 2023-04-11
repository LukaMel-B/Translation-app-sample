import 'package:get/get.dart';
import 'package:translation_app/app/data/models/country_name_getter_model.dart';

class GetCountryNameProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return GetCountryName.fromJson(map);
      if (map is List) {
        return map.map((item) => GetCountryName.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://restcountries.com/v3.1/lang';
  }

  Future<String> getGetCountryName(String language) async {
    final response = await get('https://restcountries.com/v3.1/lang/$language');
    if (response.statusCode == 200) {
      final country = getCountryNameFromJson(response.bodyString!);
      return country[0].name.common;
    } else {
      return '';
    }
  }

  Future<Response<GetCountryName>> postGetCountryName(
          GetCountryName getCountryName) async =>
      await post('GetCountryName', GetCountryName);
  Future<Response> deleteGetCountryName(int id) async =>
      await delete('GetCountryName/$id');
}
