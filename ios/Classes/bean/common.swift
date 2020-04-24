//
//  common.swift
//  amap
//
//  Created by James Karl on 2019/9/14.
//

import Foundation
import MAMapKit

struct LatLngData {
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    init(json: [String: Any?]) {
        latitude = json["latitude"] as? Double ?? 0.0
        longitude = json["longitude"] as? Double ?? 0.0
    }

    init(lat _: Double = 0.0, lon _: Double = 0.0) {}
}

struct ScreenPoint {
    var x: Int
    var y: Int
}

struct LatLngBoundsData {
    var northeast: LatLngData = LatLngData()
    var southwest: LatLngData = LatLngData()
}

struct CameraPositionData {
    var bearing: Double?
    var target: LatLngData?
    var tilt: Double?
    var zoom: Double?

    init(json: [String: Any?]) {
        bearing = json["bearing"] as? Double
        tilt = json["tilt"] as? Double
        zoom = json["zoom"] as? Double
        if let targetValue = json["target"] as? [String: Any?] {
            target = LatLngData(json: targetValue)
        }
    }
}

struct MapCreationParams {
    let cameraPosition: CameraPositionData?

    init?(json: [String: Any?]) {
        print("MapCreationParams.init", json)
        if let cameraPositionValue = json["cameraPosition"] as? [String: Any?] {
            cameraPosition = CameraPositionData(json: cameraPositionValue)
        } else {
            return nil
        }
    }
}
