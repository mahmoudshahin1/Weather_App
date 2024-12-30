import 'package:completwether/model/wethermodel.dart';
import 'package:dio/dio.dart';

class Servicewether {
  final Dio dio;

  Servicewether(this.dio);

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '061f78a9d62045f8b65111941241112';

  Future<WetherModel> getCurrentWether({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?&key=$apiKey&q=$cityName&days=1');
      WetherModel wetherModel = WetherModel.fromJson(response.data);
      return wetherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? 'opps error meesge';
      throw Exception(errMessage);
    } catch (e) {
      throw 'opps this is error ';
    }
  }
}
