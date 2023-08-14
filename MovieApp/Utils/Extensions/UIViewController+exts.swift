//
//  UIViewController+exts.swift
//  MovieApp
//
//  Created by k1d_dev on 14/08/23.
//

import UIKit

extension UIViewController {
    
    func showToast(
        with message: String,
        backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.7),
        isOnTopScreen: Bool = false,
        textColor: UIColor = UIColor.white,
        duration: Double? = 2.5,
        verticalSpace: CGFloat = 16,
        cornerRadius: CGFloat = 4,
        completion: (() -> Void)? = nil
    ) {
        
        var view: UIView? = UIView()
        view!.backgroundColor = backgroundColor
        view!.translatesAutoresizingMaskIntoConstraints = false
        view!.alpha = 0
        self.view.addSubview(view!)
        
        var space: CGFloat = verticalSpace
        var constraints = [
            view!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            view!.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: 16),
            view!.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 16)
        ]
        
        if isOnTopScreen {
            space = 8
            constraints.append(view!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: space))
        } else {
            constraints.append(view!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -space))
        }
        
        NSLayoutConstraint.activate(constraints)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.textAlignment = .center
        label.text = message
        label.numberOfLines = 0
        view!.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view!.leadingAnchor, constant: 24),
            label.topAnchor.constraint(equalTo: view!.topAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view!.trailingAnchor, constant: -24),
            label.bottomAnchor.constraint(equalTo: view!.bottomAnchor, constant: -10)
        ])
        
        view!.layoutIfNeeded()
        view!.layer.cornerRadius = cornerRadius
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.33, animations: {
                view!.alpha = 1
            }, completion: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + (duration ?? 2.5), execute: {
                    UIView.animate(withDuration: 0.33, animations: {
                        view!.alpha = 0
                    }, completion: { _ in
                        view!.removeFromSuperview()
                        view = nil
                        completion?()
                    })
                })
            })
        }
    }
    
}
