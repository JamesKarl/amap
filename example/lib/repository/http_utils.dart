import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:amap_example/repository/transport/transport.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'request_result.dart';

abstract class HttpClient {
  Future<ApiRequestResult> postRequest(
    String url, {
    Map<String, dynamic> params,
    String body,
    String dataKey,
    bool fakeData = false,
    bool fullUrl = false,
  });

  const HttpClient();
}

class Apis extends HttpClient with TransportApi {
  static const String _CONTENT_TYPE_JSON = "application/json";
  static const String _CONTENT_TYPE_FORM_URL_ENCODED =
      "application/x-www-form-urlencoded";

  final String _httpRoot;
  final String _fakeDataRoot;
  final String _accessToken;
  final bool _isDebug;

  const Apis(
      this._httpRoot, this._fakeDataRoot, this._accessToken, this._isDebug);

  Future<ApiRequestResult> postRequest(
    String url, {
    Map<String, dynamic> params,
    String body,
    String dataKey,
    bool fakeData = false,
    bool fullUrl = false,
  }) async {
    String finalUrl =
        fakeData ? _fakeDataRoot + url + ".json" : _httpRoot + url;
    if (fullUrl == true) {
      finalUrl = url;
    }
    final headers = _createHeader(contentTypeJson: body != null);

    final Map<String, String> finalParams = {};
    params?.forEach((k, v) {
      if (v != null) {
        finalParams[k] = v.toString();
      }
    });

    if (_isDebug) {
      print(finalUrl);
      print(headers);

      if (finalParams.isNotEmpty) {
        debugPrint("params: $finalParams");
      }

      if (body != null) {
        debugPrint("body: $body");
      }

      _printCurlLog(body, finalParams, headers, finalUrl);
    }

    Response response;
    try {
      final now = DateTime.now();
      if (fakeData) {
        response = await get(finalUrl);
      } else {
        response = await post(finalUrl,
            headers: headers,
            body: body != null
                ? body
                : (finalParams.isNotEmpty ? finalParams : null));
      }

      final result = ApiRequestResult(
          body: response.body, httpCode: response.statusCode, dataKey: dataKey);
      if (_isDebug) {
        print(finalUrl +
            " (${DateTime.now().millisecondsSinceEpoch - now.millisecondsSinceEpoch}ms)");
        print(result);
      }
      return result;
    } catch (t, s) {
      if (_isDebug) {
        print(t);
        print(s);
      }

      final result = ApiRequestResult(
          body: response?.body ?? "", httpCode: response?.statusCode ?? -1);

      if (t is SocketException) {
        result.message = t.toString();
      }

      return result;
    }
  }

  Map<String, String> _createHeader({bool contentTypeJson: false}) {
    return {
      "Device": "Android",
      "osType": "1",
      "version": "1.0.0",
      "Content-Type":
          contentTypeJson ? _CONTENT_TYPE_JSON : _CONTENT_TYPE_FORM_URL_ENCODED,
      "token": _accessToken
    };
  }

  void _printCurlLog(String body, Map<String, dynamic> params,
      Map<String, String> headers, String url) {
    final sb = StringBuffer();
    sb.write(" curl -i -X POST ");
    sb.write('-H "Accept-Encoding:compress;q=0.5, gzip;q=1.0" ');

    if (params != null && params.isNotEmpty) {
      final pb = StringBuffer();
      params.forEach((k, v) {
        pb.write("$k=$v&");
      });
      pb.write("xxx=xxx");
      sb.write(" -d \"${pb.toString()}\" ");
    }

    if (body != null) {
      sb.write(" -d $body ");
    }

    if (headers != null && headers.isNotEmpty) {
      headers.forEach((k, v) {
        sb.write("-H \"$k:$v\" ");
      });
    }

    sb.write(url);

    print(sb.toString());
  }
}
