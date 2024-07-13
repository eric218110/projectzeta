abstract class HttpClientProvider {
  Future<T> post<T, B>(B body, String url);
}
