//
//  MoviesTableCell.swift
//  Movies
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import UIKit

class MoviesTableCell: UITableViewCell {

    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    private var viewModel : MoviesTableCellVMRepresentable!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with cellViewModel : MoviesTableCellVMRepresentable) {
        viewModel = cellViewModel
        setData()
    }
    private func setData() {
        self.year.text = viewModel.getMoviesCellModel.year
        self.title.text = viewModel.getMoviesCellModel.title
        self.poster.load(url: viewModel.getMoviesCellModel.poster)
    }
    
}
