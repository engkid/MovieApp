//
//  UIImageView+exts.swift
//  MovieApp
//
//  Created by k1d_dev on 12/08/23.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                debugPrint("Image download error:", error)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
        
        task.resume()
    }
}
