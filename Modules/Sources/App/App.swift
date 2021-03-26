//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import CoreProviders
import FeatureMoodAnalyzer
import FeatureTweets
import UIKit

public final class RootViewController: UIViewController {
    
    private let userTweets: UserInputViewController
    private let networkService = NetworkService()
    public init() {
        self.userTweets = UserInputViewController(delegate: nil,
                                                  network: self.networkService)
        super.init(nibName: nil, bundle: nil)
        self.userTweets.setupDelegate(self)
        self.navigationItem.title = "Sentimento do Tweet"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.addChild(self.userTweets)
        self.view.addSubview(self.userTweets.view)
        self.userTweets.view.frame = self.view.bounds
        self.userTweets.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.userTweets.didMove(toParent: self)
    }
    
    func presentMoodAnalyzer(with tweet: String,
                             networkService: NetworkServiceable) -> UIViewController {
        MoodAnalyzerViewController(tweet: tweet, networkService: networkService)
    }
}

extension RootViewController: FeatureTweetsDelegate {
    public func didFinishUsingTweetsModule(with tweet: String, from: UIViewController) {
        from.present(self.presentMoodAnalyzer(with: tweet, networkService: self.networkService), animated: true, completion: nil)
    }
}
