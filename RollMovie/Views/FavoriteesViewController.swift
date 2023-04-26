//
//  FavoriteesViewController.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 21.04.2023.
//

import UIKit

class FavoritesViewController: UIViewController, FavoritesPresenterView {
    func reloadData() {
        tableView.reloadData()
    }
    

    // MARK: - Properties
        
        private let tableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorStyle = .none
            tableView.backgroundColor = .black
            return tableView
        }()
    
    private let cellId = "FavoritesTableViewCell"
    
    lazy var presenter = FavoritesPresenter(with: self)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .black
            title = "Favorites"
            
            setupTableView()
        }
    

        
        // MARK: - Helpers
        
        private func setupTableView() {
            view.addSubview(tableView)
            
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: cellId)
            
            tableView.dataSource = self
            tableView.delegate = self
        }
  
    
    }



    // MARK: - UITableViewDataSource

    extension FavoritesViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Вернуть количество ячеек в секции (в данном случае - 10)
            presenter.movies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Извлечь ячейку из пула и привести ее к типу FavoritesTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavoritesTableViewCell
                   let movie = presenter.movies[indexPath.row]
            cell.movieImageView.loadImage(from: URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath!)")!)
            cell.titleLabel.text = movie.title
            if let genreName = movie.genres?.first?.name {
                cell.genreLabel.text = genreName
            } else {
                cell.genreLabel.text = ""
            }
            let year = String(movie.releaseDate!.prefix(4))
            cell.yearLabel.text = year
            cell.scoreLabel.text = String(movie.voteAverage!)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let movie = presenter.movies[indexPath.row]
            let detailViewController = UINavigationController(rootViewController: DetailViewController(movie: movie))
            // Установить анимацию перехода
            detailViewController.modalPresentationStyle = .fullScreen
            detailViewController.modalTransitionStyle = .flipHorizontal

            // Показать DetailViewController с анимацией
            present(detailViewController, animated: true, completion: nil)
        
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                presenter.removeMovie(atIndex: indexPath.row)
                print(presenter.movies)
            }
        }
    }

    // MARK: - UITableViewDelegate

    extension FavoritesViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // Вернуть высоту ячейки
            return 120
        }
    }
