import 'package:projectzeta/data/provider/http/client.dart';
import 'package:projectzeta/data/provider/http/response.dart';
import 'package:uno/uno.dart';

class UnoHttpClientProvider implements HttpClientProvider {
  final Uno uno;

  UnoHttpClientProvider._internal(this.uno);

  factory UnoHttpClientProvider.init() {
    var unoInstance = _makeInstance();
    return UnoHttpClientProvider._internal(unoInstance);
  }

  static Uno _makeInstance() {
    return Uno(
      timeout: const Duration(seconds: 30),
    );
  }

  @override
  Future<T> post<T, B>(B body, String url) async {
    try {
      final response = await uno.post(url, data: body);

      if (response.status == 200) {
        return response.data as T;
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<HttpResponse> get(String url, String? token) async {
    try {
      var headers = {"Authorization": "Bearer $token"};

      final response = await uno.get(url, headers: headers);

      if (response.status == 200) {
        return HttpResponse(response.data);
      } else {
        throw Exception('Failed to get data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
