//
//  ReplyToFlutter.swift
//  amap
//
//  Created by James Karl on 2019/9/11.
//

import Foundation

class ReplyToFlutter {
    var id: String
    var success: Bool
    var message: String?
    var data: Any?
    
    private init(id: String = "???", success: Bool, message: String? = nil, data: Any? = nil) {
        self.id = id
        self.success = success
        self.message = message
        self.data = data
    }
    
    static func success(id: String = "???", data: Any? = nil) -> ReplyToFlutter {
        return ReplyToFlutter(id: id, success: true, message: nil, data: data)
    }
    
    static func failed(id: String = "???", message: String = "", data: Any? = nil) -> ReplyToFlutter {
        return ReplyToFlutter(id: id, success: false, message: message, data: data)
    }
    
    static func illegalArgumentException(message: String = "Illegal Argument Exception") -> ReplyToFlutter {
        return failed(message: message)
    }
    
    static func notImplemented(message: String = "NOT implemented Exception") -> ReplyToFlutter {
        return failed(message: message)
    }
    
    func toJson() -> String? {
        let jsonData = [
            "id": id,
            "success": success,
            "message": message,
            "data": data
        ]
        if let json = try? JSONSerialization.data(withJSONObject: jsonData, options: []) {
            return String(data: json, encoding: .utf8)
        }
        return nil
    }
}
