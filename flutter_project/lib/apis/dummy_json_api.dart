import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class DummyJsonApi {
  String get collectionName;
  static const uriAuthority = 'dummyjson.com';
  static const uriUnencodedPath = '/auth/resource/';
  static const Map<String, String> contentTypeHeader = {
    'Content-Type': 'application/json'
  };

  Future<Map<String, String>> _getAuthHeaders() async {
    // TODO: get token from isar/change notifier
    const token = '';
    final authHeader = {
      'Authorization': 'Bearer $token',
    };
    authHeader.addAll(contentTypeHeader);
    return authHeader;
  }

  Future<List<Map<String, dynamic>>> getObjectsPaginated({
    int pageSize = 10,
    int skip = 0,
  }) async {
    try {
      final headers = await _getAuthHeaders();
      final urlWithParameters = Uri.https(
        uriAuthority,
        uriUnencodedPath + collectionName,
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

  Future<Map<String, dynamic>> postAddObject(
    Map<String, dynamic> objectJson,
    String postPath,
  ) async {
    try {
      final uri = Uri.https(
        uriAuthority,
        postPath,
      );
      final body = jsonEncode(objectJson);
      final response = await http.post(
        uri,
        headers: contentTypeHeader,
        body: body,
      );
      return jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
