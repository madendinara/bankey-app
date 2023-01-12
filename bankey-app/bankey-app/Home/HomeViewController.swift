//
//  HomeViewController.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: LogoutDelegate?
    
    // MARK: - Views
    lazy var welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        return label
    }()
    lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log out", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Methods
    
    @objc func logoutButtonTapped() {
        delegate?.didSignOut()
    }
    
    func configure() {
        [welcomeLabel, logoutButton].forEach { view.addSubview($0) }
        makeConstraints()
    }
    
    func makeConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
