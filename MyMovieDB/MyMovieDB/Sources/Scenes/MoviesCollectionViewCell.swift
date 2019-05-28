//
//  MoviesCollectionViewCell.swift
//  MyMovieDB
//
//  Created by Chrytian Salgado Pessoal on 26/05/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

protocol MovieCollectionViewDelegate {
    func handlerActionFavorite()
}

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieBannerIv: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    var cellDelegate: MovieCollectionViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayUI(_ movie: MovieResult) {
        self.backgroundColor = .black
//        btnFavorite.isSelected = true
        lblMovieName.text = movie.title
        movieBannerIv.image = UIImage(contentsOfFile: "\(getUrl())\(movie.poster_path)")
    }
    
    private func getUrl() -> String {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseUrl
        return urlComponents.string ?? ""
    }
    
    @IBAction func actionFavorite(_ sender: Any) {
        cellDelegate?.handlerActionFavorite()
    }
}