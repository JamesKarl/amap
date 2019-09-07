import 'package:amap/amap.dart';

class PolylineOptions {
  List<LatLng> points;
  int color;
  List<int> colorValues;
  bool geodesic; //设置线段是否为大地曲线，默认false，不画大地曲线。
  bool dottedLine;
  bool useGradient;
  bool visible;
  LineCapType lineCapType;
  LineJoinType lineJoinType;
  DottedLineType dottedLineType;
  double rangeBegin, rangeEnd;
  double transparency;
  double width;
  double zIndex;

  PolylineOptions({
    this.points,
    this.color,
    this.colorValues,
    this.geodesic,
    this.dottedLine,
    this.useGradient,
    this.visible,
    this.lineCapType,
    this.lineJoinType,
    this.dottedLineType,
    this.rangeBegin,
    this.rangeEnd,
    this.transparency,
    this.width,
    this.zIndex,
  });

  Map<String, dynamic> toJson() {
    return {
      'points': this.points,
      'color': this.color,
      'colorValues': this.colorValues,
      'geodesic': this.geodesic,
      'dottedLine': this.dottedLine,
      'useGradient': this.useGradient,
      'visible': this.visible,
      'lineCapType': this.lineCapType.index,
      'lineJoinType': this.lineJoinType.index,
      'dottedLineType': this.dottedLineType.index,
      'rangeBegin': this.rangeBegin,
      'rangeEnd': this.rangeEnd,
      'transparency': this.transparency,
      'width': this.width,
      'zIndex': this.zIndex,
    };
  }

  @override
  String toString() {
    return 'PolylineOptions{points: $points, color: $color, colorValues: $colorValues, geodesic: $geodesic, dottedLine: $dottedLine, useGradient: $useGradient, visible: $visible, lineCapType: $lineCapType, lineJoinType: $lineJoinType, dottedLineType: $dottedLineType, rangeBegin: $rangeBegin, rangeEnd: $rangeEnd, transparency: $transparency, width: $width, zIndex: $zIndex}';
  }

  factory PolylineOptions.fromJson(Map<String, dynamic> map) {
    return new PolylineOptions(
      points: map['points'] as List<LatLng>,
      color: map['color'] as int,
      colorValues: map['colorValues'] as List<int>,
      geodesic: map['geodesic'] as bool,
      dottedLine: map['dottedLine'] as bool,
      useGradient: map['useGradient'] as bool,
      visible: map['visible'] as bool,
      lineCapType: map['lineCapType'] as LineCapType,
      lineJoinType: map['lineJoinType'] as LineJoinType,
      dottedLineType: map['dottedLineType'] as DottedLineType,
      rangeBegin: map['rangeBegin'] as double,
      rangeEnd: map['rangeEnd'] as double,
      transparency: map['transparency'] as double,
      width: map['width'] as double,
      zIndex: map['zIndex'] as double,
    );
  }
}

enum LineCapType {
  LineCapButt, //普通头
  LineCapSquare, //扩展头
  LineCapArrow, //箭头
  LineCapRound, //圆形头
}

enum LineJoinType {
  LineJoinBevel, //斜面连接点
  LineJoinMiter, //斜接连接点
  LineJoinRound, //圆角连接点
}

enum DottedLineType { square, circle }
