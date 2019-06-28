//
//  MoviesTableCellVM.swift
//  Movies
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation

protocol MoviesTableCellVMRepresentable {
    var getMoviesCellModel : MovieCellModel { get  }
    var reloadTable : () -> Void { get set}
}

class MoviesTableCellVM : MoviesTableCellVMRepresentable {
    var getMoviesCellModel: MovieCellModel
    
    var reloadTable: () -> Void = {}
    init(movies : Movies) {
        self.getMoviesCellModel = MovieCellModel(data: movies)
    }
    
    
}
