//
//  common.swift
//  amap
//
//  Created by James Karl on 2019/9/14.
//

import Foundation
import MAMapKit

extension CLLocationCoordinate2D {
    init?(json: [String: Double]) {
       /* if let lat = json["latitude"], let lon = json["longitude"] {
            self.latitude = lat
            self.longitude = lon
        } else {
            return nil
        }
 */
        return nil
    }
}

struct ScreenPoint {
    var x: Int
    var y: Int
    
    //    func toPoint() -> MAPoint
}


