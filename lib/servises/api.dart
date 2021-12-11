import 'package:dio/dio.dart';
import 'package:intereiws/model/model.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://nulled-download.com/wallpapper/apilist.php';

  Future<List<ImageData>?> getUser() async {
    List<ImageData>? user;
    try {
      Response userData = await _dio.get(_baseUrl);
      print('User Info: ${userData.data}');
      user = imageDataFromJson(userData.data) as List<ImageData>?;
      print("User my user $user");
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }
}
