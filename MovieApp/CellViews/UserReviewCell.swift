//
//  UserReviewCell.swift
//  MovieApp
//
//  Created by Engkit on 13/08/23.
//

import UIKit

final class UserReviewCell: UICollectionViewCell {
    
    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.lineBreakMode = .byWordWrapping
        authorLabel.font = UIFont.boldSystemFont(ofSize: authorLabel.font.pointSize)
        return authorLabel
    }()
    
    private let reviewLabel: UILabel = {
        let reviewLabel = UILabel()
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.numberOfLines = 4
        return reviewLabel
    }()
    
    private let createdAtLabel: UILabel = {
        let createdAtLabel = UILabel()
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        createdAtLabel.textColor = .systemGray
        return createdAtLabel
    }()
    
    private let horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.alignment = .fill
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillProportionally
        
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.addArrangedSubview(spacerView)
        
        return horizontalStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(review: UserReview) {
        self.authorLabel.text = review.author
        self.createdAtLabel.text = review.createdAt.formatToHumanReadableDate(inputFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", outputFormat: "MMMM dd, yyyy 'at' HH:mm a")
        self.reviewLabel.text = review.content
    }
    
    // MARK: - Private functions
    private func setupViews() {
        horizontalStackView.addArrangedSubview(self.authorLabel)
        horizontalStackView.addArrangedSubview(self.createdAtLabel)
        contentView.addSubview(horizontalStackView)
        contentView.addSubview(reviewLabel)
        
        // Create constraints for the horizontal stack view
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
        ])
        
        // Create constraints for the authorLabel within the horizontal stack view
//        NSLayoutConstraint.activate([
//            authorLabel.widthAnchor.constraint(lessThanOrEqualTo: horizontalStackView.widthAnchor, multiplier: 0.5), // Set a width constraint if needed
//        ])
//
//        // Create constraints for the reviewLabel
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 8.0),
            reviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            reviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
        ])
    }
    
}
