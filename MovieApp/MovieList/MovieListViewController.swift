//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieListViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: MovieListPresenterInterface!
    
    // MARK: - Private properties -
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.createLayout()
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        return collectionView
    }()

    private var dataSource: UICollectionViewDiffableDataSource<MovieListSection, MovieListItem>!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie List"
        self.view.addSubview(collectionView)
        self.setupViews()
        self.configureDataSource()
        
        Task {
            try await self.presenter.discoverMovie()
        }
        
        
    }
    
    private func setupViews(insets: UIEdgeInsets = .zero) {
        
        collectionView.registerCellWithoutNib(MovieListCell.self)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: insets.top),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: insets.right),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: insets.left),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: insets.bottom)
        ])
        
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
        
        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in
            let sections = MovieListSection(rawValue: sectionIndex)
            
            switch sections {
            case .movieList:
                
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.50),
                        heightDimension: .absolute(350)
                    )
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(350)
                    ),
                    subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(
                    top: 16,
                    leading: 16,
                    bottom: 20,
                    trailing: 16
                )
                return section
            case .none:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .absolute(0),
                        heightDimension: .absolute(0)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        }, configuration: config)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<MovieListSection, MovieListItem>(collectionView: collectionView) { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            switch itemIdentifier.type {
            case .movieList(let movie):
                let cell = collectionView.dequeueReusableCell(withClass: MovieListCell.self, for: indexPath)
                
                cell.configure(model: movie)
                
                return cell
            }
        }
    }
    
}

// MARK: - Extensions -

extension MovieListViewController: MovieListViewInterface {
    
    func applySnapshot(item: [MovieListItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<MovieListSection, MovieListItem>()
        
        snapshot.appendSections([.movieList])
        snapshot.appendItems(item)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

extension MovieListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = dataSource.itemIdentifier(for: indexPath)
        
        
    }
    
}
