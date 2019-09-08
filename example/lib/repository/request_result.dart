import 'dart:convert';

class ApiRequestResult {
  final String body;
  final int httpCode;
  int code;
  String message;
  String _status;
  dynamic data;
  final String dataKey;

  var _parseDataSuccess = true;

  ApiRequestResult({this.body, this.httpCode, this.dataKey}) {
    if (httpCode == 200 && body != null) {
      try {
        final Map<String, dynamic> result = jsonDecode(body);
        code = result["code"];
        message = result["message"];
        _status = result["status"];
        if (_status == "success") {
          if (dataKey != null && dataKey.isNotEmpty) {
            data = result["data"][dataKey];
          } else {
            data = result["data"];
          }
        } else {
          data = result["data"];
        }
      } catch (e, s) {
        _parseDataSuccess = false;
        print(e);
        print(s);
      }
    }
  }

  ApiRequestResult.fakeResult() : this(httpCode: 200);

  bool success() =>
      _parseDataSuccess && httpCode == 200 && _status == "success";

  @override
  String toString() {
    return "RequestResult:{httpCode: $httpCode, parseDataSuccess: $_parseDataSuccess, status: $_status"
        " code: $code, message: $message, "
        "${(success() && data != null) ? ('\ndata: ' + jsonEncode(data)) : ('\nbody: ' + (body ?? ""))}\n";
  }
}

class ApiResult {
  final ApiRequestResult rawResult;
  final dynamic data;

  const ApiResult({this.rawResult, this.data});

  bool success() =>
      identical(this, ok) || (rawResult != null && rawResult.success());

  int code() => rawResult.code;

  String message() => rawResult?.message ?? "";

  static final ApiResult ok = ApiResult();

  factory ApiResult.fakeResult(int code, String message, {dynamic data}) {
    return ApiResult(
        rawResult: ApiRequestResult.fakeResult()
          ..message = message
          ..code = code,
        data: data);
  }

  @override
  String toString() {
    return 'ApiResult{success: ${success()}, message: ${message()}, rawResult: $rawResult}';
  }
}
