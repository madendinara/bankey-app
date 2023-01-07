//
//  ViewController.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/6/23.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    // MARK: - Methods
    
    @objc func signInTapped() {
        
    }
    
    // MARK: - Configure
    
    func configureView() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        [loginView, sigInButton].forEach { view.addSubview($0) }
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
    }

}

