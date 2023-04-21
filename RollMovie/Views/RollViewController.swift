//
//  ViewController.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 21.04.2023.
//

import UIKit
import SnapKit

class RollViewController: UIViewController {

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
           setupConstraints()
       }
       
       private func setupConstraints() {
           imageView.snp.makeConstraints { make in
               make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
               make.centerX.equalToSuperview()
               make.height.equalTo(view.snp.width).multipliedBy(0.8)
               make.width.equalTo(view.snp.width).multipliedBy(0.7)
           }
           
           titleLabel.snp.makeConstraints { make in
               make.top.equalTo(imageView.snp.bottom).offset(16)
               make.centerX.equalToSuperview()
           }
           
           subtitleLabel.snp.makeConstraints { make in
               make.top.equalTo(titleLabel.snp.bottom).offset(8)
               make.centerX.equalToSuperview()
           }
           
           rollButton.snp.makeConstraints { make in
               make.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
               make.centerX.equalToSuperview()
               make.width.equalToSuperview().multipliedBy(0.8)
               make.height.equalTo(50)
           }
       }
   }

