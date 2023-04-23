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
            
            self.imageView.loadImage(from: URL(string: "http://image.tmdb.org/t/p/w500\(movie.poster_path!)")!)
            self.titleLabel.text = movie.title
            self.subtitleLabel.text = movie.overview
            
            print(movie)
        }
    }
    
    

    lazy var presenter = RollPresenter(with: self)
    
    private var movie = Movie(genres: [Genre(name: "")], id: 0, title: "", overview: "", poster_path: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", release_date: "", voteAverage: 0)

    private let imageView: UIImageView = {
           let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           imageView.backgroundColor = .lightGray
           imageView.layer.cornerRadius = 10
        
        
           return imageView
       }()
       
       private let titleLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
           label.textColor = .black
           label.textAlignment = .center
           label.text = "Title"
           return label
       }()
       
       private let subtitleLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
           label.textColor = .black
           label.textAlignment = .center
           label.text = "Subtitle"
           label.numberOfLines = 0 // устанавливаем количество строк в 0
               label.translatesAutoresizingMaskIntoConstraints = false // отключаем автоматически сгенерированные ограничения
           return label
       }()
       
       private let rollButton: UIButton = {
           let button = UIButton()
           button.backgroundColor = .blue
           button.setTitle("Roll", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 10
           return button
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           
           
           view.backgroundColor = .white
           view.addSubview(imageView)
           view.addSubview(titleLabel)
           view.addSubview(subtitleLabel)
           view.addSubview(rollButton)
//           imageView.loadImage(from: URL(string: "http://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")!)
           imageView.loadImage(from: URL(string: "http://image.tmdb.org/t/p/w500/9Rj8l6gElLpRL7Kj17iZhrT5Zuw.jpg")!)
           
           rollButton.addTarget(self, action: #selector(rollButtonTapped), for: .touchUpInside)
           
           setupConstraints()
       }
       
       private func setupConstraints() {
           imageView.snp.makeConstraints { make in
               make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
               make.centerX.equalToSuperview()
               make.bottom.equalToSuperview().multipliedBy(0.5)
               make.width.equalTo(imageView.snp.height).multipliedBy(0.7)
           }
           
           titleLabel.snp.makeConstraints { make in
               make.top.equalTo(imageView.snp.bottom).offset(16)
               make.centerX.equalToSuperview()
           }
           
           subtitleLabel.snp.makeConstraints { make in
               make.top.equalTo(titleLabel.snp.bottom).offset(8)
               make.bottom.equalTo(rollButton.snp.top).offset(-8)
               make.width.equalToSuperview().offset(-16)
               make.centerX.equalToSuperview()
           }
           
           rollButton.snp.makeConstraints { make in
               make.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
               make.centerX.equalToSuperview()
               make.width.equalToSuperview().multipliedBy(0.8)
               make.height.equalTo(50)
           }
       }
    
    func setValues() {
//        titleLabel.text = movie.originalTitle
        
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
