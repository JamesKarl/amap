//
//  ReplyToFlutter.swift
//  amap
//
//  Created by James Karl on 2019/9/11.
//

import Foundation

class ReplyToFlutter<T: Codable> : Codable {
    var id: String
    var success: Bool
    var message: String?
    var data: T?
    
    private init(id: String = "???", success: Bool, message: String? = nil, data: T? = nil) {
        self.id = id
        self.success = success
        self.message = message
        self.data = data
    }
    
    static func success(id: String, data: T? = nil) -> ReplyToFlutter {
        return ReplyToFlutter(id: id, success: true, message: nil, data: data)
    }
    
    static func failed(id: String, message: String, data: T? = nil) -> ReplyToFlutter {
        return ReplyToFlutter(id: id, success: false, message: message, data: data)
    }
}
