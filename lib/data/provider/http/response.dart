class HttpResponse {
  final Map<String, dynamic> _response;

  HttpResponse(this._response);

  List<Map<String, dynamic>> get content =>
      _response['content'] ?? List.empty();
}
