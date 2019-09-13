//
//  FlutterApi.swift
//  amap
//
//  Created by James Karl on 2019/9/12.
//

import Foundation
import MAMapKit

protocol FlutterApi {
    func handle(mapView: MAMapView, methodId: String, data: Any?) -> ReplyToFlutter?
}
