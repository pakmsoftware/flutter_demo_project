class PagedResultList<T> {
  final int pageSize;
  final int skip;
  final List<T> elements;

  PagedResultList({
    required this.pageSize,
    required this.skip,
    required this.elements,
  });

  bool get hasMorePages => elements.length >= pageSize;
}
