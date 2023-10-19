import 'dart:convert';
import 'package:store_challenge/core/enums/request_type.dart';
import 'package:store_challenge/core/enums/request_type_multipart.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = "fakestoreapi.com";
  static var client = http.Client();

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {
      //!--- Required for request ----
      //*--- Make full api url ------

      var uri = Uri.https(baseUrl, url, params);

      //To save api response
      late http.Response response;
      Map<String, dynamic> jsonResponse = {};
      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
              await client.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              body: jsonEncode(body), headers: headers);
          break;
      }
      dynamic result;
      try {
        result = jsonDecode(const Utf8Codec().decode(response.bodyBytes));
      } catch (e) {
        e;
      }
      jsonResponse.putIfAbsent(
          'response',
          () =>
              result ??
              {'title': const Utf8Codec().decode(response.bodyBytes)});
      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      return jsonResponse;
    } catch (e) {
      e;
    }
  }
}
