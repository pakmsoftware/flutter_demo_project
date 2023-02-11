import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

// custom client class for dummyjson API
// check https://dummyjson.com for API documentation
abstract class DummyJsonApi {
  final http.Client httpClient;

  DummyJsonApi(this.httpClient);
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
          'limit': '$pageSize',
          'skip': '$skip',
        },
      );

      final response =
          await httpClient.get(urlWithParameters, headers: headers);
      List<dynamic> responseJson = jsonDecode(response.body);
      final mapElements = responseJson
          .map((element) => element as Map<String, dynamic>)
          .toList();

      return mapElements;
    } catch (e) {
      log(e.toString());
      rethrow;
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
      final response = await httpClient.post(
        uri,
        headers: contentTypeHeader,
        body: body,
      );
      // when 200 code is returned
      return jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
