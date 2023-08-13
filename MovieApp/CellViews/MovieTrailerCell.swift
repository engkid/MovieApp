//
//  MovieTrailerCell.swift
//  MovieApp
//
//  Created by Engkit on 13/08/23.
//

import UIKit
import YouTubeiOSPlayerHelper

final class MovieTrailerCell: UICollectionViewCell {
    
    private let youtubePlayerView: YTPlayerView = {
        let ytPlayerView = YTPlayerView()
        ytPlayerView.translatesAutoresizingMaskIntoConstraints = false
        return ytPlayerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ videoId: String) {
        youtubePlayerView.load(withVideoId: videoId)
    }
    
    // MARK: - Private properties
    private func setupViews() {
        contentView.addSubview(youtubePlayerView)
        
        NSLayoutConstraint.activate([
            youtubePlayerView.heightAnchor.constraint(equalToConstant: 250),
            youtubePlayerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            youtubePlayerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            youtubePlayerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            youtubePlayerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0)
        ])
    }
}
