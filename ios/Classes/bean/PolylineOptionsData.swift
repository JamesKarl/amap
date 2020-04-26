//
//  PolylineOptionsData.swift
//  amap
//
//  Created by James Karl on 2020/4/24.
//

import Foundation
import MAMapKit

class PolylineOptionsData : Codable {
    var points: [LatLngData]? = nil
    var color: Int? = nil
    var colorValues: [Int]? = nil
    var geodesic: Bool? = nil
    var dottedLine: Bool? = nil
    var useGradient: Bool? = nil
    var dottedLineType: Int? = nil
    var transparency: Float? = nil
    var width: Float? = nil
    var zIndex: Float? = nil
    var visible: Bool? = nil
    var rangeBegin: Double? = nil
    var rangeEnd: Double? = nil
    var lineCapType: Int? = nil
    var lineJoinType: Int? = nil
    
    
    init?(json: [String:Any?]) {
        self.color = json["color"] as? Int
        self.colorValues = json["colorValues"] as? [Int]
        self.geodesic = json["geodesic"] as? Bool
        self.dottedLine = json["dottedLine"] as? Bool
        self.useGradient = json["useGradient"] as? Bool
        self.dottedLineType = json["dottedLineType"] as? Int
        self.transparency = json["transparency"] as? Float
        self.width = json["width"] as? Float
        self.zIndex = json["zIndex"] as? Float
        self.visible = json["visible"] as? Bool
        self.rangeBegin = json["rangeBegin"] as? Double
        self.rangeEnd = json["rangeEnd"] as? Double
        self.lineCapType = json["lineCapType"] as? Int
        self.lineJoinType = json["lineJoinType"] as? Int
        
        if let pointList = json["points"] as? [[String: Double]]{
            self.points = []
            for p in pointList {
                self.points?.append(LatLngData(json: p))
            }
        }
        
        if self.points == nil || self.points!.isEmpty  {
            return nil
        }
    }
    
    func getMapPoints() -> [CLLocationCoordinate2D]? {
        if let pointList = points {
            return pointList.map { $0.toMapPoint()}
        }
        return nil
    }
    
    func getPolyline() -> MAMultiPolyline? {
//        if let points = points?.map({ CLLocationCoordinate2DMake($0.latitude, $0.longitude)}) {
//            return MAMultiPolyline.init(points: &points, count: UInt(points.count), drawStyleIndexes: [])
//        }
    }
}
