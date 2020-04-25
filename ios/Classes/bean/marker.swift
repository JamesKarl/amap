//
//  marker.swift
//  amap
//
//  Created by James Karl on 2019/9/14.
//

import Foundation
import MAMapKit

extension MAPointAnnotation {
    
    convenience init?(json: [String: Any?]) {
        self.init()
//        self.alpha = json['alpha'] as? Double;
//        this.anchorU = json['anchorU'];
//        this.anchorV = json['anchorV'];
//        this.draggable = json['draggable'];
//        this.icon = json['icon'];
//        this.icons = json['icons'];
//        this.infoWindowOffsetX = json['infoWindowOffsetX'];
//        this.infoWindowOffsetY = json['infoWindowOffsetY'];
//        this.infoWindowEnable = json['infoWindowEnable'];
//        this.period = json['period'];
//        this.position = json['position'];
//        this.rotateAngle = json['rotateAngle'];
//        this.snippet = json['snippet'];
//        this.title = json['title'];
//        this.zIndex = json['zIndex'];
//        this.visible = json['visible'];
//        this.flat = json['flat'];
//        this.gps = json['gps'];
//        this.extra = json['extra'];
        if let position = json["position"] as? [String: Double] {
            if let center = CLLocationCoordinate2D(json: position) {
                self.coordinate = center
                self.title = json["title"] as? String
                self.subtitle = json["snippet"] as? String
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

extension MAAnnotation {
   
}

struct AnnotationViewData {
    var alpha: Float? = nil
    var anchorU: Float? = nil
    var anchorV: Float? = nil
    var draggable: Bool? = nil
    var icon: String? = nil //todo
    var infoWindowOffsetX: Int? = nil
    var infoWindowOffsetY: Int? = nil
    var infoWindowEnable: Bool? = nil
    var period: Int? = nil
    var position: LatLngData? = nil
    var rotateAngle: Float? = nil
    var snippet: String? = nil
    var title: String? = nil
    var zIndex: Float? = nil
    var visible: Bool? = nil
    var flat: Bool? = nil
    var extra: Any? = nil
    var gps: Bool? = nil
    
    init(annotationView: MAAnnotationView) {
        self.alpha = Float(annotationView.alpha)
        self.title = annotationView.annotation.title
        self.position = annotationView.annotation.coordinate.toLatLngData()
        self.snippet = annotationView.annotation.description
        ///TODO other fields
    }
}
