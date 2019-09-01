//
//  Defaults.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let (nameKey, addressKey) = ("name", "address")
    static let userSessionKey = "com.save.usersession"
    static let languageKey = "language"
    
    struct Model {
        var name: String
        var address: String
        
        init(_ json: [String: String]) {
            self.name = json[nameKey] ?? ""
            self.address = json[addressKey] ?? ""
        }
    }
    
    static func save(_ name: String, with address: String){
        UserDefaults.standard.set([nameKey: name, addressKey: address], forKey: userSessionKey)
    }
    
    static func getNameAndAddress()-> Model {
        return Model((UserDefaults.standard.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
    
    static func save(key:String,value:String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func retrieve(key:String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    static func clearUserData(){
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
}
