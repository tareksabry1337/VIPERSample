//
//  UsersWorker.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import Foundation

class UsersWorker {
    
    private let networkLayer = NetworkLayer()
    
    func getUsers(completionHandler: @escaping (Result<[User]>) -> ()) {
        networkLayer.request(UserRouter.get, decodeToType: [User].self, completionHandler: completionHandler)
    }
    
}
