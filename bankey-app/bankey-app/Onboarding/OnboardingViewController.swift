//
//  OnboardingViewController.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/9/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    var imageName: String
    var titleText: String
    
    // MARK: - Views
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = titleText
        return label
    }()
    
    // MARK: - Init
    
    init(imageName: String, titleText: String) {
        self.imageName = imageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Methods
    
    // MARK: - Configure view
    func configureView() {
        view.backgroundColor = .systemBackground
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
