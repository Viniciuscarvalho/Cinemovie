//
//  UpcomingMoviesCellFactory.swift
//  Cinemaker
//
//  Created by Vinicius Marques on 26/02/18.
//  Copyright © 2018 Vinicius Carvalho. All rights reserved.
//

import Foundation
import UIKit.UIImage

struct UpcomingMoviesCellFactory {
    
    static func generateCell(movie: Movie, genres: [Genre], image: UIImage, cell: MovieTableViewCell) {
        cell.configure(movie: movie)
        let movieGenres = genres.filter({ movie.genresIds.contains($0.id) })
        cell.configure(genres: movieGenres)
        
        cell.configure(image: image)
    }
}
