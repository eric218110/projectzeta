class Page {
  final int size;
  final int page;

  Page({
    required this.size,
    required this.page,
  });

  factory Page.init() {
    return Page(size: 10, page: 0);
  }

  String toUrlPagination(String url) {
    return '$url?size=$size&page=$page';
  }
}
