//
//  UserRouter.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import Foundation
import Alamofire

import Alamofire

enum UserRouter: URLRequestConvertible {
    
    case get
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .get:
            return nil
        }
    }
    
    var url: URL {
        let relativePath : String?
        switch self {
        case .get:
            relativePath = Constants.usersEndpoint
        }
        
        var url = URL(string: Constants.baseURL)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}

