//
//  ViewController.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/6/23.
//

import UIKit
import SnapKit

protocol LogoutDelegate: AnyObject {
    func didSignOut()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    
    // MARK: - Properties
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    // MARK: - Views
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    lazy var sigInButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return button
    }()
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.text = "error"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        sigInButton.configuration?.showsActivityIndicator = false
    }
    // MARK: - Methods
    
    @objc func signInTapped() {
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password cannot be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(with: "Username or password cannot be blank")
            return
        }
        
        if username == "Dinara" && password == "Welcome" {
            sigInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
            errorLabel.isHidden = true
        } else {
            configureView(with: "Wrong username or password")
        }
    }
    
    private func configureView(with message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
    // MARK: - Configure
    
    func configureView() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        [loginView, sigInButton, errorLabel].forEach { view.addSubview($0) }
        makeConstraints()
        
        
    }
    
    func makeConstraints() {
        loginView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        sigInButton.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).offset(16)
            make.leading.equalTo(loginView.snp.leading)
            make.trailing.equalTo(loginView.snp.trailing)
        }
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(sigInButton.snp.bottom).offset(16)
            make.leading.equalTo(sigInButton.snp.leading)
            make.trailing.equalTo(sigInButton.snp.trailing)
        }
    }
    
}

