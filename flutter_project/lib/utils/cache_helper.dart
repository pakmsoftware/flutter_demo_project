class CacheHelper {
  static String getCacheKey(int pageSize, int skip) {
    return 'pageSize=${pageSize}skip=$skip';
  }
}
