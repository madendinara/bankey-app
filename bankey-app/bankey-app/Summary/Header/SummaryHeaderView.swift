//
//  SummaryHeaderView.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/14/23.
//

import UIKit

class SummaryHeaderView: UIView {
    
    // MARK: - Propeties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bankey"
        label.numberOfLines = 0
        return label
    }()
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Good morning"
        return label
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Dinara"
        return label
    }()
    lazy var headerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, greetingLabel, nameLabel])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure() {
        backgroundColor = .systemTeal
        [headerStack, headerImageView].forEach { addSubview($0) }
        makeConstraints()
    }
    
    func makeConstraints() {
        headerStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        headerImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
    }
    
}

