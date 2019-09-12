//
//  MessageFromFlutter.swift
//  amap
//
//  Created by James Karl on 2019/9/12.
//

import Foundation

struct MessageFromFlutter<T: Codable>: Codable {
    var id: String
    var data: T?
}
