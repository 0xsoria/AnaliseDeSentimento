//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import CoreProviders
import UIKit

public final class MoodAnalyzerViewController: UIViewController {

    private let mainView = MoodAnalyzerView()
    private let tweet: String
    private var moodChecker: MoodCheckable

    public init(tweet: String, networkService: NetworkServiceable) {
        self.tweet = tweet
        self.moodChecker = MoodChecker(moodNetwork: MoodNetwork(network: networkService))
        super.init(nibName: nil, bundle: nil)
        self.mainView.setupTweet(tweet)
        self.moodChecker.moodCheckerDelegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        self.view = self.mainView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.moodChecker.checkMood(for: self.tweet)
        self.mainView.setLoadingView(true)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension MoodAnalyzerViewController: MoodCheckerDelegate {
    func didReceive(_ mood: String) {
        self.mainView.setupMoodLabel(mood)
        self.mainView.setLoadingView(false)
    }
    
    func didReceiveError() {
        let alert = UIAlertController(title: "Erro!", message: "Erro ao vefificar o sentimento, tente novamente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tente novamente", style: .default, handler: { _ in
            self.moodChecker.checkMood(for: self.tweet)
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
