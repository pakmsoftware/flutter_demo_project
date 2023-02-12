class PagedResultList<T> {
  final int pageSize;
  final int pageNumber;
  final List<T> elements;

  PagedResultList({
    required this.pageSize,
    required this.pageNumber,
    required this.elements,
  });

  bool get hasMorePages => elements.length >= pageSize;
}
