import 'package:projectzeta/data/provider/http/client.dart';
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
}
