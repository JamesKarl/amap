//
//  FlutterApi.swift
//  amap
//
//  Created by James Karl on 2019/9/12.
//

import Foundation
import MAMapKit

protocol FlutterApi {
    
    //return true if message has been handled.
    func handle(methodId: String, mapView: MAMapView, data: Any?) -> Bool
}
