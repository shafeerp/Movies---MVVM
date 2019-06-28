//
//  APIClient.swift
//  MVVM
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation
class APIClient {
    var baseURL = URL(string: "http://www.omdbapi.com/")
    
    func fetch<T : Codable>(apiRequest : APIRequest, completion : @escaping (Result<T ,Error>) -> Void) {
        
        let request = apiRequest.request(baseURL: baseURL!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(.failure(error!))
                return
            }
            do {
                let model : T = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(model))
            }
            catch(let partsingError){
                completion(.failure(partsingError))
            }
            
        }
        task.resume()
    }
}
