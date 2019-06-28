//
//  Movies.swift
//  Movies
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

struct MoviesList : Codable {
    var movies : [Movies]
    var totalResults : String
    var response : String
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
    }
}
struct Movies : Codable {
    var title : String
    var year : String
    var imdbID : String
    var type : String
    var poster : String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
        
    }
}
