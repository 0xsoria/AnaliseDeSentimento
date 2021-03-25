//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import UIKit

final class MoodAnalyzerView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Tweet"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        return label
    }()

    private lazy var tweetLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private lazy var progressView: UIActivityIndicatorView = {
        let progress = UIActivityIndicatorView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    private lazy var moodLabelTitle: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Sentimento"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private lazy var moodLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    init() {
        super.init(frame: .zero)
        self.setupHierarchy()
        self.backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTweet(_ tweet: String) {
        self.tweetLabel.text = tweet
    }
    
    func setupMoodLabel(_ mood: String) {
        self.moodLabel.text = mood
    }
    
    func setLoadingView(_ status: Bool) {
        self.progressView.isHidden = status
        if status {
            self.progressView.startAnimating()
        } else {
            self.progressView.stopAnimating()
        }
    }
    
    func setupHierarchy() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.tweetLabel)
        self.addSubview(self.progressView)
        self.addSubview(self.moodLabel)
        self.addSubview(self.moodLabelTitle)
        
        
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.tweetLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,
                                             constant: 20).isActive = true
        self.tweetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                 constant: 10).isActive = true
        self.tweetLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                  constant: -10).isActive = true
        
        //mood title
        self.moodLabelTitle.topAnchor.constraint(equalTo: self.tweetLabel.bottomAnchor, constant: 50).isActive = true
        self.moodLabelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.moodLabelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.moodLabelTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //mood label
        self.moodLabel.topAnchor.constraint(equalTo: self.moodLabelTitle.bottomAnchor, constant: 10).isActive = true
        self.moodLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.moodLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
        //progress view
        self.progressView.topAnchor.constraint(equalTo: self.moodLabel.bottomAnchor, constant: 10).isActive = true
        self.progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
