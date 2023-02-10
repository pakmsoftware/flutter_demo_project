import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class DummyJsonApi {
  String get collectionName;

  Future<Map<String, String>> _getAuthHeaders() async {
    // TODO: get token from isar
    final token = '';
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  Future<List<Map<String, dynamic>>> getObjectsPaginated({
    int pageSize = 10,
    int skip = 0,
  }) async {
    try {
      final headers = await _getAuthHeaders();
      final urlWithParameters = Uri.https(
        'dummyjson.com',
        '/auth/resource/',
        {
          'limit': pageSize,
          'skip': skip,
        },
      );

      final response = await http.get(urlWithParameters, headers: headers);
      List<Map<String, dynamic>> responseJson = jsonDecode(response.body);
      return responseJson;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
