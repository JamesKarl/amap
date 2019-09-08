import 'package:amap_example/repository/request_result.dart';
import 'package:amap_example/repository/transport/bean/RegionItemBean.dart';

import '../http_utils.dart';

mixin TransportApi on HttpClient {
  Future<ApiResult> fetchRegionList() async {
    final result = await postRequest("map/startRegionList", dataKey: "list");
    if (result.success()) {
      final items = result.data;
      return ApiResult(
        rawResult: result,
        data: items is List
            ? items.map((it) => RegionBean.fromJson(it)).toList()
            : null,
      );
    }
    return ApiResult(rawResult: result);
  }
}
