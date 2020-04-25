//
//  common.swift
//  amap
//
//  Created by James Karl on 2019/9/14.
//

import Foundation
import MAMapKit

struct LatLngData : Codable {
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    init(json: [String: Any?]) {
        latitude = json["latitude"] as? Double ?? 0.0
        longitude = json["longitude"] as? Double ?? 0.0
    }

    init(lat _: Double = 0.0, lon _: Double = 0.0) {}
}

struct ScreenPoint : Codable {
    var x: Int
    var y: Int
}

struct LatLngBoundsData : Codable {
    var northeast: LatLngData = LatLngData()
    var southwest: LatLngData = LatLngData()
}

struct CameraPositionData : Codable {
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



struct UiSettings : Codable {
    var logoPosition: Int?
    var zoomPosition: Int?
    var compassEnabled: Bool?
    var gestureScaleByMapCenter: Bool?
    var indoorSwitchEnabled: Bool?
    var myLocationButtonEnabled: Bool?
    var rotateGesturesEnabled: Bool?
    var scaleControlsEnabled: Bool?
    var scrollGesturesEnabled: Bool?
    var tiltGesturesEnabled: Bool?
    var zoomControlsEnabled: Bool?
    var zoomGesturesEnabled: Bool?
    var allGesturesEnabled: Bool?
    
    init(json: [String: Any?]) {
        logoPosition = json["logoPosition"] as? Int
        zoomPosition = json["zoomPosition"] as? Int
        compassEnabled = json["compassEnabled"] as? Bool
        gestureScaleByMapCenter = json["gestureScaleByMapCenter"] as? Bool
        indoorSwitchEnabled = json["indoorSwitchEnabled"] as? Bool
        myLocationButtonEnabled = json["myLocationButtonEnabled"] as? Bool
        rotateGesturesEnabled = json["rotateGesturesEnabled"] as? Bool
        scaleControlsEnabled = json["scaleControlsEnabled"] as? Bool
        scrollGesturesEnabled = json["scrollGesturesEnabled"] as? Bool
        tiltGesturesEnabled = json["tiltGesturesEnabled"] as? Bool
        zoomControlsEnabled = json["zoomControlsEnabled"] as? Bool
        zoomGesturesEnabled = json["zoomGesturesEnabled"] as? Bool
        allGesturesEnabled = json["allGesturesEnabled"] as? Bool
    }
}

struct MapCreationParams : Codable {
    let cameraPosition: CameraPositionData?
    let settings: UiSettings?
    

    init(json: [String: Any?]) {
        print("MapCreationParams.init", json)
        if let cameraPositionValue = json["cameraPosition"] as? [String: Any?] {
            cameraPosition = CameraPositionData(json: cameraPositionValue)
        } else {
            cameraPosition = nil
        }
        if let settingsValue = json["settings"] as? [String: Any?] {
            settings = UiSettings(json: settingsValue)
        } else {
            settings = nil
        }
    }
}
