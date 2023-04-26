//
//  FavoritesPresenter.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 26.04.2023.
//

import Foundation

protocol FavoritesPresenterView: AnyObject {
    func reloadData()
    
}


class FavoritesPresenter {
    
    weak var view: FavoritesPresenterView?
    
    var movies: [Movie] = []
    
    init(with view: FavoritesPresenterView) {
        self.view = view
        self.loadSavedMoviesFromUserDefaults()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleNewMovieAdded), name: Notification.Name("NewMovieAdded"), object: nil)
    }
    
    @objc private func handleNewMovieAdded() {
        movies.removeAll()
            loadSavedMoviesFromUserDefaults()
        DispatchQueue.main.async {
               self.view?.reloadData()
           }
        }
    
    func loadSavedMoviesFromUserDefaults() {
        guard let savedMoviesData = UserDefaults.standard.object(forKey: "savedMovies") as? Data,
              let savedMovies = try? PropertyListDecoder().decode([Movie].self, from: savedMoviesData) else {
            return
        }
        
        movies.append(contentsOf: savedMovies)
    }
    
    func removeMovie(atIndex index: Int) {
        let userDefaults = UserDefaults.standard
        movies.remove(at: index)
      

        if let moviesData = try? PropertyListEncoder().encode(movies) {
            userDefaults.set(moviesData, forKey: "savedMovies")
        }
        view?.reloadData()
        print(movies.count)
    }
      
      func numberOfMovies() -> Int {
          return movies.count
      }
      
      func movie(forIndex index: Int) -> Movie {
          return movies[index]
      }
    
}

protocol Observer {
    func update()
}
