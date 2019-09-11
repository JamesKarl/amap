//
//  PlatformMapView.swift
//  amap
//
//  Created by James Karl on 2019/9/11.
//

import Foundation
import MAMapKit

class PlatformMapView : NSObject, FlutterPlatformView {
    
    let frame: CGRect
    let viewId: Int64
    let args: Any?
    
    init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.args = args
    }
    
    func view() -> UIView {
        return MAMapView(frame: frame)
    }
}
