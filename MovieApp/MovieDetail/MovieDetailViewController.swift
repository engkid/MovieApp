//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by k1d_dev on 12/08/23.
//  Copyright (c) 2023 k1d_dev. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieDetailViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: MovieDetailPresenterInterface!
    
    // MARK: - Private properties -
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.createLayout()
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<MovieDetailSection, MovieDetailItem>!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        self.title = presenter.title
        self.setupViews()
        self.configureDataSource()
        
        Task {
            try await self.presenter.viewDidLoad()
        }
    }
    
    // MARK: - Private functions -
    
    private func setupViews(insets: UIEdgeInsets = .zero) {
        
        collectionView.registerCellWithoutNib(MovieDetailCell.self)
        collectionView.registerCellWithoutNib(MovieTrailerCell.self)
        collectionView.registerCellWithoutNib(UserReviewCell.self)
        collectionView.registerHeaderWithoutNib(SectionTitleReusableView.self)
        collectionView.registerFooterWithoutNib(SeeMoreReusableView.self)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: insets.top),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: insets.right),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: insets.left),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: insets.bottom)
        ])
        
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in
            let sections = MovieDetailSection(rawValue: sectionIndex)
            
            switch sections {
            case .moviedetail:
                
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(670)
                    ),
                    subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(
                    top: 0,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )
                
                return section
            case .movieTrailer:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(270)
                    )
                )
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(270)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(
                    top: 0,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
            case .userReview:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(135)
                    )
                )
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(135)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(
                    top: 16,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                
                section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
                
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
                        widthDimension: .estimated(1),
                        heightDimension: .estimated(1)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        })
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<MovieDetailSection, MovieDetailItem>(collectionView: collectionView) {(collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            
            switch itemIdentifier.type {
            case .movieDetail(let movie):
                let cell = collectionView.dequeueReusableCell(withClass: MovieDetailCell.self, for: indexPath)
                
                cell.configure(model: movie)
                
                return cell
            case .movieTrailer(let movieId):
                let cell = collectionView.dequeueReusableCell(withClass: MovieTrailerCell.self, for: indexPath)
                
                cell.configure(movieId)
                
                return cell
            case .emptyMovieTrailer(let emptyTrailerTitle):
                let cell = collectionView.dequeueReusableCell(withClass: UserReviewCell.self, for: indexPath)
                
                cell.configure(cellType: .emptyState(emptyTrailerTitle))
                
                return cell
            case .userReviews(let userReview):
                let cell = collectionView.dequeueReusableCell(withClass: UserReviewCell.self, for: indexPath)
                
                cell.configure(cellType: .regular(review: userReview))
                
                return cell
            case .emptyUserReview(let emptyTitle):
                let cell = collectionView.dequeueReusableCell(withClass: UserReviewCell.self, for: indexPath)
                
                cell.configure(cellType: .emptyState(emptyTitle))
                
                return cell
            }
        }
        
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self, let section = MovieDetailSection(rawValue: indexPath.section) else {
                return nil
            }
            
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                
                switch section {
                case .userReview:
                    let headerView: SectionTitleReusableView = collectionView.dequeueHeader(SectionTitleReusableView.self, indexPath: indexPath)
                    headerView.configure(with: "User Reviews")
                    return headerView
                case .movieTrailer:
                    let headerView: SectionTitleReusableView = collectionView.dequeueHeader(SectionTitleReusableView.self, indexPath: indexPath)
                    headerView.configure(with: "Movie Trailer")
                    return headerView
                default:
                    return nil
                }
            
            case UICollectionView.elementKindSectionFooter:
                
                let userReviews: [MovieDetailItem] = self.dataSource.snapshot().itemIdentifiers(inSection: .userReview)
                
                if section == .userReview {
                    
                    if let type: MovieDetailCellType = userReviews.first?.type {
                        
                        switch type {
                        case .emptyUserReview:
                            let footerView: SeeMoreReusableView = collectionView.dequeueFooter(SeeMoreReusableView.self, indexPath: indexPath)
                            
                            footerView.disableSeeMoreButton()
                            
                            return footerView
                        case .userReviews:
                            let footerView: SeeMoreReusableView = collectionView.dequeueFooter(SeeMoreReusableView.self, indexPath: indexPath)
                            
                            footerView.seeMoreButtonTapped = {
                                self.presenter.navigate(to: .userReviewDetail, navigationController: self.navigationController)
                            }
                            
                            return footerView
                        default: return nil
                        }
                    }
                }
                
            default:
                return nil
            }
            return nil
        }
        
    }
}

// MARK: - Extensions -

extension MovieDetailViewController: MovieDetailViewInterface {
    
    func applySnapshot(items: [MovieDetailItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<MovieDetailSection, MovieDetailItem>()
        
        snapshot.appendSections([.moviedetail, .movieTrailer, .userReview])
        
        for item in items {
            
            switch item.type {
            case .movieDetail(let movie):
                snapshot.appendItems([.init(section: .moviedetail, type: .movieDetail(movie))], toSection: .moviedetail)
            case .userReviews(let review):
                snapshot.appendItems([.init(section: .userReview, type: .userReviews(review))], toSection: .userReview)
            case .emptyMovieTrailer(let emptyTrailerTitle):
                snapshot.appendItems([.init(section: .movieTrailer, type: .emptyMovieTrailer(emptyTrailerTitle))], toSection: .movieTrailer)
            case .movieTrailer(let movieId):
                snapshot.appendItems([.init(section: .movieTrailer, type: .movieTrailer(movieId))], toSection: .movieTrailer)
            case .emptyUserReview(let emptyTitle):
                snapshot.appendItems([.init(section: .userReview, type: .emptyUserReview(emptyTitle))], toSection: .userReview)
            }
        }
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
