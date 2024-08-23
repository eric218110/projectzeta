class HttpResponse {
  final Map<dynamic, dynamic> _response;

  HttpResponse(this._response);

  List<dynamic> get content => _response['content'] ?? List.empty();
}
