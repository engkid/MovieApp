//
//  UICollectionView+exts.swift
//  MovieApp
//
//  Created by Engkit on 11/08/23.
//

import UIKit

protocol ConfigUICollectionView {
    func registerCellWithoutNib(_ cell: UICollectionViewCell.Type)
}

extension ConfigUICollectionView where Self: UICollectionView {
    
    func registerCellWithoutNib(_ cell: UICollectionViewCell.Type) {
        register(cell, forCellWithReuseIdentifier: String(describing: cell.self))
    }
    
}

extension UICollectionView: ConfigUICollectionView {}

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
    
}
