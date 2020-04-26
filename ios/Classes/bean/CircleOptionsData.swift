//
//  CircleOptionsData.swift
//  amap
//
//  Created by James Karl on 2020/4/26.
//

import Foundation

struct CircleOptionsData {
    var holeOptions: [CircleHoleOptionsData]? = nil
    var center: LatLngData? = nil
    var fillColor: Int? = nil
    var radius: Double? = nil
    var strokeColor: Int? = nil
    var strokeDottedLineType: Int? = nil
    var strokeWidth: Float? = nil
    var zIndex: Float? = nil
    var visible: Bool? = nil
    
    init(json: [String:Any?]) {
        self.fillColor = json["fillColor"] as? Int
        self.radius = json["radius"] as? Double
        self.strokeColor = json["strokeColor"] as? Int
        self.strokeDottedLineType = json["strokeDottedLineType"] as? Int
        self.strokeWidth = json["strokeWidth"] as? Float
        self.zIndex = json["zIndex"] as? Float
        self.visible = json["visible"] as? Bool
        
        if let centerValue = json["center"] as? [String: Double] {
            self.center = LatLngData(json: centerValue)
        }
        
        if let holeOptionsValue = json["holeOptions"] as? [Any] {
            if !holeOptionsValue.isEmpty {
                self.holeOptions = []
                holeOptionsValue.forEach { (option) in
                    if let o = option as? [String: Any?] {
                        self.holeOptions?.append(CircleHoleOptionsData(json: o))
                    }
                }
            }
        }
    }
}

struct CircleHoleOptionsData {
    var center: LatLngData? = nil
    var radius: Double? = nil
    
    init(json: [String: Any?]) {
        self.radius = json["radius"] as? Double
        if let centerValue = json["center"] as? [String: Any?] {
            self.center = LatLngData(json: centerValue)
        }
    }
}
