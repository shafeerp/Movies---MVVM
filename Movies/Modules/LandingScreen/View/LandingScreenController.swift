//
//  ViewController.swift
//  Movies
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import UIKit

class LandingScreenController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    var viewModel : MoviesControllerVMRepresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableCell()
        configureViewModel()
        // Do any additional setup after loading the view.
    }
    
    func setupTableCell() {
        
        moviesTableView.register(UINib(nibName: "MoviesTableCell", bundle: nil), forCellReuseIdentifier: "MoviesTableCell")
        
    }
    
    func configureViewModel() {
        viewModel = MoviesControllerVM()
        viewModel.loadView()
        viewModel.reloadTable = { [weak self] in
            DispatchQueue.main.async {
                self?.moviesTableView.reloadData()
            }
            
        }
        
        viewModel.onError  = { error in
            print(error)
        }
    }
    
    private func cellForMoviesTable(indexPath : IndexPath) -> MoviesTableCell {
        let moviesCell = moviesTableView.dequeueReusableCell(withIdentifier: "MoviesTableCell", for: indexPath) as! MoviesTableCell
        moviesCell.configure(with: viewModel.getMoviesCellViewModelFor(row: indexPath.row))
        return moviesCell
        
    }


}

extension LandingScreenController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.dataCount - 1 == indexPath.row {
            viewModel.loadView()
        }
        return cellForMoviesTable(indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
