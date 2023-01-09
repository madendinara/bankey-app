//
//  OnboardingViewController.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/9/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Views
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "world")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Methods
    
    // MARK: - Configure view
    func configureView() {
        view.addSubview(stackView)
        makeConstraints()
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.leading.equalToSuperview().inset(8)
            make.trailing.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
}
