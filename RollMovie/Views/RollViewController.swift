//
//  ViewController.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 21.04.2023.
//

import UIKit
import SnapKit

class RollViewController: UIViewController, RollPresenterView {
    func presentMovie(movie: Movie) {
        self.movie = movie
        
        DispatchQueue.main.async {
            
            self.imageView.loadImage(from: URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath!)")!)
            self.titleLabel.text = movie.title
            if let genreName = movie.genres?.first?.name {
                self.genreLabel.text = genreName
            } else {
                self.genreLabel.text = ""
            }
            let year = String(movie.releaseDate!.prefix(4))
            self.yearLabel.text = year
            self.scoreLabel.text = String(movie.voteAverage!)
            
            
            
            print(movie)
        }
        self.imageView.isHidden = false
        self.titleLabel.isHidden = false
        self.genreLabel.isHidden = false
        self.scoreLabel.isHidden = false
        self.yearLabel.isHidden = false
    }
    
    

    lazy var presenter = RollPresenter(with: self)
    
    private var movie = Movie(genres: [Genre(name: "")], id: 0, title: "BlackmarkBlackmarkBlackmarkBlackmarkBlackmark", overview: "1963 Military Industrialist Arthur Blackmark must race against the clock to stop an international incident which threatens to end the world.1963 Military Industrialist Arthur Blackmark must race against the clock to stop an international incident which threatens to end the world.1963 Military Industrialist Arthur Blackmark must race against the clock to stop an international incident which threatens to end the world.", posterPath: "", releaseDate: "", voteAverage: 0)
                                                     
    

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 24
        imageView.isHidden = true
        return imageView
    }()
       
       private let titleLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
           label.textColor = .white
           label.textAlignment = .center
           label.text = "Title"
           label.adjustsFontSizeToFitWidth = true
           label.minimumScaleFactor = 0.5 // Максимально разрешенный масштаб шрифта
           label.isHidden = true
           return label
       }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "Horror"
        label.isHidden = true
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .light)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "1994"
        label.isHidden = true
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .light)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "6.3"
        label.isHidden = true
        return label
    }()
              
       private let rollButton: UIButton = {
           let button = UIButton()
           button.backgroundColor = .orange
           button.setTitle("Roll", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 10
           return button
       }()
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .black
           view.addSubview(imageView)
           view.addSubview(titleLabel)
           view.addSubview(genreLabel)
           view.addSubview(scoreLabel)
           view.addSubview(yearLabel)
           view.addSubview(rollButton)
                      
           
           
           
           rollButton.addTarget(self, action: #selector(rollButtonTapped), for: .touchUpInside)
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
           imageView.isUserInteractionEnabled = true
           imageView.addGestureRecognizer(tapGesture)
           
           let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
           titleLabel.isUserInteractionEnabled = true
           titleLabel.addGestureRecognizer(labelTapGesture)
           
           
        
           
           
           navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(didTapFavorites))
           navigationItem.rightBarButtonItem?.tintColor = .orange
           
           titleLabel.text = movie.title
           
           setupConstraints()
       }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-16)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            
        }
        
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(16)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.right.equalToSuperview().offset(-16)
        }
        
        rollButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(22)
        }
    }
    
    @objc func movieTapped() {
        let detailViewController = UINavigationController(rootViewController: DetailViewController(movie: movie))
        // Установить анимацию перехода
        detailViewController.modalPresentationStyle = .fullScreen
        detailViewController.modalTransitionStyle = .flipHorizontal

        // Показать DetailViewController с анимацией
        present(detailViewController, animated: true, completion: nil)
        }
    
    @objc private func didTapFavorites() {
        presenter.saveMovieToUserDefaults(movie: movie)
        }
    
    @objc private func rollButtonTapped() {
        presenter.getMovie()
       }

   }

extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }.resume()
    }
}
