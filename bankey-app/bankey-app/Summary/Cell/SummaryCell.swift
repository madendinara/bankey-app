//
//  SummaryCell.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/15/23.
//

import UIKit

class SummaryCell: UITableViewCell {
    
    
    // MARK: - Properties
    static let reuseId = "SummaryCell"
    static let rowHeight: CGFloat = 112
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Banking"
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "No Fee"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Some Balance"
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    lazy var balanceAmountLabel: UILabel = {
        let label = UILabel()
        label.attributedText = makeFormattedBalance(dollars: "435298", cents: "45")
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    lazy var balanceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [balanceLabel, balanceAmountLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right")?.withTintColor(.systemTeal, renderingMode: .alwaysOriginal))
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(with viewModel: SummaryCellViewModel) {
        nameLabel.text = viewModel.accountName
        typeLabel.text = viewModel.accountType.rawValue
        
        switch viewModel.accountType {
        case .Banking:
            underLineView.backgroundColor = .systemTeal
            typeLabel.text = "Banking"
        case .CreditCard:
            underLineView.backgroundColor = .systemBlue
            typeLabel.text = "Credit Card"
        case .Investment:
            underLineView.backgroundColor = .systemOrange
            typeLabel.text = "Investment"
        }
    }
    
    func configure() {
        [typeLabel, underLineView, nameLabel, balanceStackView, chevronImageView].forEach { contentView.addSubview($0) }
        makeConstraints()
    }
    
    func makeConstraints() {
        typeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(16)
        }
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.size.equalTo(CGSize(width: 60, height: 3))
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(underLineView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        balanceStackView.snp.makeConstraints { make in
            make.top.equalTo(underLineView.snp.bottom).offset(8)
            make.leading.equalTo(nameLabel.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(32)
        }
        chevronImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.centerY.equalTo(balanceStackView)
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        
    }
}

extension SummaryCell {
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 4]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 4]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}
