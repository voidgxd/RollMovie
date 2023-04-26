//
//  FavoritesTableViewCell.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 22.04.2023.
//

import UIKit
import SnapKit

class FavoritesTableViewCell: UITableViewCell {

    // MARK: - Properties

    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.text = "The Godfather"
        return label
    }()

    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.text = "Crime"
        return label
    }()

    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.text = "9.2"
        return label
    }()

    let yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.text = "1972"
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(movieImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(yearLabel)
        

        movieImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(80)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(movieImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(movieImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(4)
            make.trailing.equalToSuperview().inset(16)
        }

        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(4)
            make.leading.equalTo(movieImageView.snp.trailing).offset(16)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
