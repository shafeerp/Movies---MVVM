//
//  MoviesRequest.swift
//  Movies
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation
class MoviesRequest : APIRequest {
    var method = RequestType.GET
    
    var path =  ""
    
    var parameters: [String : String]
    
    init(parameters : [String:String]) {
        self.parameters = parameters
    }
    
    
    
}
