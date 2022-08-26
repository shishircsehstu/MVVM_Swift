//
//  UserModel.swift
//  MVVMDemo
//
//  Created by Saddam on 22/8/22.
//

import Foundation

struct UserModel: Codable{
    
    var name: String
    var username: String
    var email: String
    var address: UserAddress
}

struct UserAddress: Codable{
    
    var street: String
    var suite: String
    var city: String
}
