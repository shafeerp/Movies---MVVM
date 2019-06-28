//
//  MovieCellModel.swift
//  Movies
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation

class MovieCellModel {
    var year: String
    var title: String
    var poster: String
    
    init(data : Movies) {
        self.year = data.year
        self.title = data.title
        self.poster = data.poster
    }
}
