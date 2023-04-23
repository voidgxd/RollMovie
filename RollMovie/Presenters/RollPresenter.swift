//
//  RollPresenter.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 22.04.2023.
//

import UIKit
import Alamofire

protocol RollPresenterView: AnyObject {
    func presentMovie(movie: Movie)
    
}


class RollPresenter {
    
    weak var view: RollPresenterView?
    
    init(with view: RollPresenterView) {
        self.view = view
    }
    
//    public func getMovie() {
//
//        let number = Int.random(in: 1...1000000)
//
//        AF.request("https://api.themoviedb.org/3/movie/\(number)?api_key=959ae9673671152f8d38a4295016b132").response { response in
//
//            guard let data = response.data else {
//                if let error = response.error {
//                    print(error)
//                }
//                return
//            }
//
//            do {
//                let movie = try JSONDecoder().decode(Movie.self, from: data)
//
//                // check if the required properties have non-nil values
//                guard let title = movie.title,
//                      let posterPath = movie.poster_path,
//                      let releaseDate = movie.releaseDate else {
//                          // if any of the required properties is nil, call the function again
//                          getMovie()
//                          return
//                      }
//
//                // all required properties have non-nil values, so present the movie
//                self.view?.presentMovie(movie: movie)
//
//            } catch {
//                print("Error decoding movie: \(error.localizedDescription)")
//            }
//        }
//    }
    
    
    public func getMovie() {

        let number = Int.random(in: 1...1000000)

        AF.request("https://api.themoviedb.org/3/movie/\(number)?api_key=959ae9673671152f8d38a4295016b132").response { response in

            guard let data = response.data else {
                if let error = response.error {
                    print(error)
                }
                return
            }
            do {
                guard let movie = try? JSONDecoder().decode(Movie.self, from: data)

                else {
                    print("error")
                    return
                }
                guard (movie.title != nil), (movie.release_date != nil), movie.poster_path != nil
                else {
                    self.getMovie()
                    return
                }
                
                self.view?.presentMovie(movie: movie)

            }
        }

    }
    
 
}


