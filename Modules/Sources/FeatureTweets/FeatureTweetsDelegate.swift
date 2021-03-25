//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 25/03/21.
//

import UIKit

public protocol FeatureTweetsDelegate: AnyObject {
    func didFinishUsingTweetsModule(with tweet: String, from: UIViewController)
}
