//
//  EndpointProtocol.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import Alamofire

protocol EndpointProtocol : URLRequestConvertible {
    
    var path: String { get }
    var url: String { get }
    var method: HTTPMethod { get }
}

extension EndpointProtocol {
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url: try self.url.asURL())
        urlRequest.httpMethod = self.method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest)
    }
}
