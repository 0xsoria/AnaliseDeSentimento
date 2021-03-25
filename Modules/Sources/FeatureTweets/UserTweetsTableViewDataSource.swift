//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 25/03/21.
//

import UIKit

protocol TweetsDelegate: AnyObject {
    func didSelect(_ tweet: TweetData)
}

final class UserTweetsTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var data: [TweetData]
    private let user: String
    private weak var delegate: TweetsDelegate?

    init(data: [TweetData], user: String, delegate: TweetsDelegate?) {
        self.user = user
        self.data = data
        self.delegate = delegate
    }
    
    func updateData(_ data: [TweetData]) {
        self.data = data
    }
    
    func setupDelegate(_ delegate: TweetsDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelect(self.data[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FeatureStrings.TableViewCellStrings.tweetCell) as? TweetTableViewCell{
            cell.setupText(user: self.user, tweet: self.data[indexPath.row].text)
            return cell
        }
        return UITableViewCell()
    }
}

