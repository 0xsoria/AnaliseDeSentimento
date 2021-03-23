//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 22/03/21.
//

import Foundation

protocol MoodCheckerDelegate: AnyObject {
    func didReceive(_ mood: String)
    func didReceiveError()
}

protocol MoodCheckable {
    var moodCheckerDelegate: MoodCheckerDelegate? { get set }
    func checkMood(for sentense: String)
}

final class MoodChecker: MoodCheckable {

    weak var moodCheckerDelegate: MoodCheckerDelegate?
    private let moodNetwork: MoodNetworkable

    init(moodNetwork: MoodNetworkable) {
        self.moodNetwork = moodNetwork
    }
    
    func checkMood(for sentense: String) {
        self.moodNetwork.requestMoodAnalysis(moodString: sentense) { (result: Result<String, Errors>) in
            switch result {
            case .success(let mood):
                self.moodCheckerDelegate?.didReceive(mood)
            case .failure:
                self.moodCheckerDelegate?.didReceiveError()
            }
        }
    }
}

