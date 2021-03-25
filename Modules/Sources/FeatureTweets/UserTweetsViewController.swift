//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 24/03/21.
//

import UIKit

final class UserTweetsViewController: UIViewController {
    
    private let tableView = UITableView()
    private let dataSource: UserTweetsTableViewDataSource
    private weak var delegate: FeatureTweetsDelegate?
    
    init(tweetsAndUser: TwitterUserWithData, delegate: FeatureTweetsDelegate?) {
        self.dataSource = UserTweetsTableViewDataSource(data: tweetsAndUser.tweets,
                                                        user: tweetsAndUser.user.data.username, delegate: nil)
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.dataSource.setupDelegate(self)
        self.tableView.register(TweetTableViewCell.self,
                                forCellReuseIdentifier: FeatureStrings.TableViewCellStrings.tweetCell)
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.setupView()
        self.navigationItem.title = "@\(tweetsAndUser.user.data.username)"
    }
    
    @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setupView() {
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension UserTweetsViewController: TweetsDelegate {
    func didSelect(_ tweet: TweetData) {
        self.delegate?.didFinishUsingTweetsModule(with: tweet.text,
                                                  from: self)
    }
}
