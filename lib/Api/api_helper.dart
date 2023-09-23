import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utilities/shared_preferances_helper.dart';

class APIHelper{
  static const String baseServerURL = "https://test.com";
  static const String _baseURL = "$baseServerURL/api/";



  //=========================== api User ====================================
  static const String login = "login";
  static const String resetPassword = "login";
  static const String resetPasswordGetCode = "login";
  static const String verifyCode = "login";



  static Future postRequest(
      {required String url,
        required Map<String, String> body,
        List<http.MultipartFile> files = const [],
        Map<String, String>? headers,}) async {
    debugPrint(body.toString());
    debugPrint("$_baseURL$url");
    var request = MultipartRequest(
      'POST',
      Uri.parse('$_baseURL$url'),
      onProgress: (int bytes, int total) async {
        // final progress = bytes / total;
      },
    );
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }

    request.headers.addAll({
      'Accept': 'application/json',
      'lang': SharedPref.getCurrentLang() ?? "en",
      'Authorization': 'Bearer ${SharedPref.getUserObg()?.token}',
    });


    if (headers != null) request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String result = await response.stream.bytesToString();
    log(response.statusCode.toString());

    log(result.toString());
    try {
      return json.decode(result);
    } catch (e) {
      return null;
    }
  }

  static Future getRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    log("$_baseURL$url");
    var request = http.Request('GET', Uri.parse('$_baseURL$url'));
    if (SharedPref.getUserObg() != null) {
      request.headers.addAll({
        'Accept': 'application/json',
        'lang': SharedPref.getCurrentLang() ?? "en",
        'Authorization': 'Bearer ${SharedPref.getUserObg()?.token}'
      });
    }
    if (headers != null) request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    String result = await response.stream.bytesToString();
    return json.decode(result);
  }
}

class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(String method, Uri url, {required this.onProgress,}) : super(method, url);
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}


