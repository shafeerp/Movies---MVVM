//
//  APIRequest.swift
//  MVVM
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation


protocol APIRequest {
    var method : RequestType { get }
    var path : String { get }
    var parameters : [String : String] { get }
}

enum RequestType : String {
    case GET
    case POST
}

extension APIRequest {
    func request(baseURL : URL) -> URLRequest {
        guard var componenents = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create components")
        }
        
        componenents.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        guard let url = componenents.url else {
            fatalError("Unable to get url")
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
