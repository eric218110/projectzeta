import 'package:projectzeta/data/data.dart';

abstract class HttpClientProvider {
  Future<T> post<T, B>(B body, String url);
  Future<HttpResponse> get(String url);
}
