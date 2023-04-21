//
//  FavoriteesViewController.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 21.04.2023.
//

import UIKit

class FavoritesViewController: UIViewController {

    // MARK: - Properties
        
        private let tableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorStyle = .none
            tableView.backgroundColor = .white
            return tableView
        }()
        
        private let cellId = "FavoritesTableViewCell"
        
        // MARK: - Lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
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
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Извлечь ячейку из пула и привести ее к типу FavoritesTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavoritesTableViewCell
            
            // Настроить содержимое ячейки
            cell.backgroundColor = .white
            
            return cell
        }
    }

    // MARK: - UITableViewDelegate

    extension FavoritesViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // Вернуть высоту ячейки
            return 120
        }
    }
