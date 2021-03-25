//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import CoreProviders
import UIKit

public final class UserInputViewController: UIViewController {

    private let textField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Digite seu usuário do Twitter"
        return label
    }()

    private lazy var continueButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(self.continueAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Continuar", for: .normal)
        return button
    }()
    private let progressView = UIActivityIndicatorView()
    private weak var delegate: FeatureTweetsDelegate?
    private var requester: UserRequestable

    public init(delegate: FeatureTweetsDelegate?, network: NetworkServiceable) {
        self.requester = UserRequester(network: UserNetwork(network: network))
        super.init(nibName: nil, bundle: nil)
        self.requester.userRequesterDelegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewElements()
    }
    
    @objc
    func continueAction() {
        self.requestUser()
    }
    
    public func setupDelegate(_ delegate: FeatureTweetsDelegate) {
        self.delegate = delegate
    }
    
    private func requestUser() {
        self.requester.fetchUser(self.textField.text ?? String())
        self.progressView.isHidden = false
        self.progressView.startAnimating()
        self.continueButton.isEnabled = false
    }

    private func setupViewElements() {
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.textField)
        self.textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.textField.widthAnchor.constraint(equalTo: self.view.widthAnchor,
                                              multiplier: 0.6).isActive = true

        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.label)
        self.label.bottomAnchor.constraint(equalTo: self.textField.topAnchor,
                                           constant: -10).isActive = true
        self.label.widthAnchor.constraint(equalTo: self.textField.widthAnchor).isActive = true
        self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(self.continueButton)
        self.continueButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 10).isActive = true
        self.continueButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.progressView.isHidden = true
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.progressView)
        self.progressView.topAnchor.constraint(equalTo: self.continueButton.bottomAnchor, constant: 10).isActive = true
        self.progressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.progressView.color = .black
        
    }
    
}

extension UserInputViewController: UserRequesterDelegate {
    func didReceive(_ user: TwitterUserWithData) {
        self.progressView.isHidden = true
        self.progressView.stopAnimating()
        self.continueButton.isEnabled = true
        let viewController = UserTweetsViewController(tweetsAndUser: user,
                                                      delegate: self.delegate)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func didReceiveError() {
        self.progressView.isHidden = true
        self.progressView.stopAnimating()
        self.continueButton.isEnabled = true
        let alert = UIAlertController(title: "Ops!", message: "Erro, tente novamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
