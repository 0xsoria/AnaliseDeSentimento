//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import CoreProviders
import FeatureTweets
import UIKit

public final class RootViewController: UIViewController {
    
    private let userTweets: UserInputViewController
    public init() {
        self.userTweets = UserInputViewController(delegate: nil,
                                                  network: NetworkService())
        super.init(nibName: nil, bundle: nil)
        self.userTweets.setupDelegate(self)
    }
    
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
}

extension RootViewController: FeatureTweetsDelegate {
    public func didFinishUsingTweetsModule(with tweet: String, from: UIViewController) {
        print("")
    }
}
