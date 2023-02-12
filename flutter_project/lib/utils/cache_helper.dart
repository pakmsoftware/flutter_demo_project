class CacheHelper {
  static String getCacheKey(int pageSize, int pageNumber) {
    return 'pageSize=${pageSize}pageNumber=$pageNumber';
  }
}
