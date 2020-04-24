//
//  AmapExtentions.swift
//  amap
//
//  Created by James Karl on 2020/4/23.
//

import Foundation
import MAMapKit

extension CLLocationCoordinate2D {
    
    init?(json: [String: Double]) {
        if let lat = json["latitude"], let lon = json["longitude"] {
            self.init()
            self.latitude = lat
            self.longitude = lon
        } else {
            return nil
        }
    }
}

extension LatLngData {
     func toMapPoint()-> CLLocationCoordinate2D {
         return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
     }
}
