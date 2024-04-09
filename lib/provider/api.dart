import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/data.dart';
import '../model/server.dart';

class Api with ChangeNotifier {
  String token;
  DataInfo? data;

  Api(this.token, this.data);

  Future<void> postData(String id, String latitude, String longitude) async {
    try {
      var _headers = {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.contentTypeHeader: 'application/vnd.api+json'
      };

      // inspect(id);

      final url = Uri.parse(ApiPath().attendance);
      final response = await http.post(
        url,
        headers: _headers,
        body: json.encode(
            {'qrcode': id, 'latitude': latitude, 'longitude': longitude}),
      );
      final extractedData =
          json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      // inspect(extractedData);
      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return;
      }

      data = DataInfo(extractedData['message']);

      // data!.message = extractedData['message'];
      // print('data info:');
      // inspect(formatter);

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
