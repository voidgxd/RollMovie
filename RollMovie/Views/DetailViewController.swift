//
//  DetailView.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 26.04.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
//    var movie: Movie = Movie(genres: [Genre(name: "")], id: 1, title: "The Godfather", overview: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", posterPath: "", releaseDate: "1972", voteAverage: 9.2)
//
    
    let movie: Movie
       
       init(movie: Movie) {
           self.movie = movie
           super.init(nibName: nil, bundle: nil)
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
           
           view.addSubview(movieImageView)
           view.addSubview(titleLabel)
           view.addSubview(genreLabel)
           view.addSubview(scoreLabel)
           view.addSubview(yearLabel)
           view.addSubview(descriptionLabel)
           setupConstrains()
           
           movieImageView.loadImage(from: URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath!)")!)
           titleLabel.text = movie.title
           if let genreName = movie.genres?.first?.name {
               genreLabel.text = genreName
           } else {
               genreLabel.text = ""
           }
           let year = String(movie.releaseDate!.prefix(4))
           yearLabel.text = year
           scoreLabel.text = String(movie.voteAverage!)
           descriptionLabel.text = movie.overview
       }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
        
    }
   }
    
    // MARK: - Properties
    
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5 // Максимально разрешенный масштаб шрифта
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
        label.textColor = .lightGray
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5 // Максимально разрешенный масштаб шрифта
        return label
    }()
    
 
func setupConstrains() {
        
        movieImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(2)
            make.trailing.equalToSuperview().inset(16)
        }
        
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(yearLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            
        }
    }


    
//    func showDetails() {
//        self.movieImageView.loadImage(from: URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath!)")!)
//        self.titleLabel.text = movie.title
//        self.descriptionLabel.text = movie.overview
//        if let genreName = movie.genres?.first?.name {
//            self.genreLabel.text = genreName
//        } else {
//            genreLabel.text = ""
//        }
//        let year = String(movie.releaseDate!.prefix(4))
//        self.yearLabel.text = year
//        self.scoreLabel.text = String(movie.voteAverage!)
//    }
    
  

