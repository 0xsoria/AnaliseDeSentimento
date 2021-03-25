//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 25/03/21.
//

import UIKit

final class TweetTableViewCell: UITableViewCell {

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let userLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let tweetLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupText(user: String, tweet: String) {
        self.userLabel.text = "@\(user)"
        self.tweetLabel.text = tweet
    }

    private func setupViews() {
        self.addSubview(self.stack)
        self.stack.addArrangedSubview(self.userLabel)
        self.stack.addArrangedSubview(self.tweetLabel)

        self.stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true

        self.userLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.tweetLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
    }
}
