import 'dart:async';

import '../../amap.dart';

mixin CameraMixin on NativeMessenger {
  //设置地图的旋转角度。
  Future<MessageReply> changeBearing(double bearing) {
    return sendMessageToNative("changeBearing", data: bearing);
  }

  //设置地图的中心点。
  Future<MessageReply> changeLatLng(LatLng latLng) {
    return sendMessageToNative("changeLatLng", data: latLng);
  }

  //设置地图倾斜度。
  Future<MessageReply> changeTilt(double tilt) {
    return sendMessageToNative("changeTilt", data: tilt);
  }

  //给地图设置一个新的状态。
  Future<MessageReply> newCameraPosition(CameraPosition cameraPosition) {
    return sendMessageToNative('newCameraPosition', data: cameraPosition);
  }

  //设置地图的中心点。
  Future<MessageReply> newLatLng(LatLng latLng) {
    return sendMessageToNative("newLatLng", data: latLng);
  }

  //设置显示在规定屏幕范围内的地图经纬度范围。
  Future<MessageReply> newLatLngBounds(
    LatLngBounds bounds,
    int width,
    int height,
    int padding,
  ) {
    return sendMessageToNative("newLatLngBounds", data: {
      "bounds": bounds,
      "width": width,
      "height": height,
      "padding": padding
    });
  }

  //设置显示在规定屏幕范围内的地图经纬度范围。
  Future<MessageReply> newLatLngBoundsRect(LatLngBounds latLngBounds,
      int paddingLeft, int paddingRight, int paddingTop, int paddingBottom) {
    return sendMessageToNative("newLatLngBoundsRect", data: {
      'latLngBounds': latLngBounds,
      'paddingLeft': paddingLeft,
      'paddingRight': paddingRight,
      'paddingTop': paddingTop,
      'paddingBottom': paddingBottom,
    });
  }

  //设置地图中心点以及缩放级别。
  Future<MessageReply> newLatLngZoom(LatLng latLng, double zoom) {
    return sendMessageToNative("newLatLngZoom", data: {
      'latLng': latLng,
      'zoom': zoom,
    });
  }

  //按像素移动地图中心点
  Future<MessageReply> scrollBy(double xPixel, double yPixel) {
    return sendMessageToNative('scrollBy', data: {
      'xPixel': xPixel,
      'yPixel': yPixel,
    });
  }

  //根据给定增量并以给定的屏幕像素点为中心点缩放地图级别。
  Future<MessageReply> zoomBy(double amount, {ScreenPoint focus}) {
    return sendMessageToNative('zoomBy', data: {
      'amount': amount,
      'focus': focus,
    });
  }

  //放大地图缩放级别，在当前地图显示的级别基础上加1。
  Future<MessageReply> zoomIn() {
    return sendMessageToNative('zoomIn');
  }

  //缩小地图缩放级别，在当前地图显示的级别基础上减1。
  Future<MessageReply> zoomOut() {
    return sendMessageToNative('zoomOut');
  }

//设置地图缩放级别。
  Future<MessageReply> zoomTo(double zoom) {
    return sendMessageToNative('zoomTo', data: zoom);
  }
}
