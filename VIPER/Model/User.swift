//
//  User.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import Foundation

class User: Codable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    var creationDate: Int?
}

struct UserViewModel {
    
    var fullName: String
    var avatar: URL?
    var registrationDate: String
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        return dateFormatter
    }()
    
    init(user: User) {
        fullName = (user.firstName ?? "") + (user.lastName ?? "")
        avatar = URL(string: user.avatar ?? "")
        registrationDate = "Registration Date: \(dateFormatter.string(from: Date(timeIntervalSince1970: Double(user.creationDate ?? 0))))"
    }
    
}
