//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import UIKit

final class MoodAnalyzerView: UIView {

    private lazy var tweetLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private lazy var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
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
    }
    
    func setupHierarchy() {
        self.addSubview(self.tweetLabel)
        self.addSubview(self.progressView)
        self.addSubview(self.moodLabel)
        
        self.tweetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                 constant: 10).isActive = true
        self.tweetLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                             constant: 20).isActive = true
        self.tweetLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                  constant: 10).isActive = true
        
        //mood label
        self.moodLabel.topAnchor.constraint(equalTo: self.tweetLabel.bottomAnchor).isActive = true
        self.moodLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.moodLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
        //progress view
        self.progressView.topAnchor.constraint(equalTo: self.tweetLabel.bottomAnchor).isActive = true
        self.progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = false
    }
}
