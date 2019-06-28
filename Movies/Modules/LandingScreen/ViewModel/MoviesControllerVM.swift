//
//  MoviesControllerVM.swift
//  Movies
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation

protocol MoviesControllerVMRepresentable {
    func loadView()
    func getMoviesCellViewModelFor(row : Int) -> MoviesTableCellVMRepresentable
    
    var dataCount : Int { get }
    var reloadTable : () -> Void { get set }
    var onError : (Error) -> Void {get set}
    var isFetching : Bool { get }
    
}

class MoviesControllerVM : MoviesControllerVMRepresentable {
    
    
    var onError: (Error) -> Void = {_ in }
    
    func loadView() {
        fetchData()
    }
    var dataCount: Int {
        return dataModel.count
    }
    
    
    var reloadTable: () -> Void = {}
    var isFetching = false
    
    var dataModel  = [Movies]()
    var pageCount = 0
    var cellViewModels = [MoviesTableCellVMRepresentable]()
    
    func getMoviesCellViewModelFor(row: Int) -> MoviesTableCellVMRepresentable {
        var cellVM = cellViewModels[row]
        cellVM.reloadTable = reloadTable
        return cellVM
    }
    
    private func fetchData() {
        if isFetching {
            return
        }
        pageCount += 1
        isFetching = true
        let moviesReq = MoviesRequest(parameters: ["apikey":"fc4c7d83","s":"movies","page":"\(pageCount)"])
        APIClient().fetch(apiRequest: moviesReq) { (result : Result<MoviesList, Error>) in
            switch result {
            case .success(let movies):
                self.dataModel.append(contentsOf: movies.movies)
                self.cellViewModels.append(contentsOf: movies.movies.map{
                    MoviesTableCellVM(movies: $0)
                })
                self.reloadTable()
                self.isFetching = false
            case .failure(let error):
                self.onError(error)
                
            }
        }
        
    }
    
    
}
