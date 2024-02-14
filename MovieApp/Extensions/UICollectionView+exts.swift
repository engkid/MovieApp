//
//  UICollectionView+exts.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//

import UIKit

protocol ConfigUICollectionView {
    func registerCellWithoutNib(_ cell: UICollectionViewCell.Type)
    func registerHeaderWithoutNib(_ cell: UICollectionReusableView.Type)
    func registerFooterWithoutNib(_ cell: UICollectionReusableView.Type)
    func dequeueHeader<T: UICollectionReusableView>(_ header: T.Type, indexPath: IndexPath) -> T
    func dequeueFooter<T: UICollectionReusableView>(_ footer: T.Type, indexPath: IndexPath) -> T
}

extension ConfigUICollectionView where Self: UICollectionView {
    
    func registerCellWithoutNib(_ cell: UICollectionViewCell.Type) {
        register(cell, forCellWithReuseIdentifier: String(describing: cell.self))
    }
    
    func registerHeaderWithoutNib(_ cell: UICollectionReusableView.Type) {
        register(cell, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: cell.self))
    }
    
    func registerFooterWithoutNib(_ cell: UICollectionReusableView.Type) {
        register(cell, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: cell.self))
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
    
    func dequeueHeader<T>(_ header: T.Type, indexPath: IndexPath) -> T where T: UICollectionReusableView {
        let view = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: header.self), for: indexPath)
		guard let reusableView = view as? T else { fatalError("\(#function) - \(#line)") }
        return reusableView
    }
    
    func dequeueFooter<T>(_ footer: T.Type, indexPath: IndexPath) -> T where T: UICollectionReusableView {
        let view = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: footer.self), for: indexPath)
		guard let reusableView = view as? T else { fatalError("\(#function) - \(#line)") }
        return reusableView
    }
    
}
