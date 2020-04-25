//
//  PolylineOptionsData.swift
//  amap
//
//  Created by James Karl on 2020/4/24.
//

import Foundation

class PolylineOptionsData : Codable{
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
    
}
