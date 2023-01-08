//
//  LoginView.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/7/23.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Properties
    
    // MARK: - Views
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.delegate = self
        return textField
    }()
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [usernameTextField, dividerView, passwordTextField])
        view.spacing = 8
        view.axis = .vertical
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    // MARK: - Configure
    
    func configureView() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        [stackView].forEach { addSubview($0) }
        makeConstaints()
    }
    
    func makeConstaints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

        
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)

        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    private func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
}

