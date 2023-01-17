//
//  SummaryViewController.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/13/23.
//

import UIKit

class SummaryViewController: UIViewController {
    
    // MARK: - Properties
    
    var accounts: [SummaryCellViewModel] = []
    var tableView = UITableView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension SummaryViewController {
    
    
    private func configure() {
        tableView.backgroundColor = .systemTeal
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SummaryCell.self, forCellReuseIdentifier: SummaryCell.reuseId)
        tableView.rowHeight = SummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        makeConstraints()
        fetchData()
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func fetchData() {
        let savings = SummaryCellViewModel(accountType: .Banking,
                                           accountName: "Basic Savings",
                                           balance: 929466.23)
        let chequing = SummaryCellViewModel(accountType: .Banking,
                                            accountName: "No-Fee All-In Chequing",
                                            balance: 17562.44)
        let visa = SummaryCellViewModel(accountType: .CreditCard,
                                        accountName: "Visa Avion Card",
                                        balance: 412.83)
        let masterCard = SummaryCellViewModel(accountType: .CreditCard,
                                              accountName: "Student Mastercard",
                                              balance: 50.83)
        let investment1 = SummaryCellViewModel(accountType: .Investment,
                                               accountName: "Tax-Free Saver",
                                               balance: 2000.00)
        let investment2 = SummaryCellViewModel(accountType: .Investment,
                                               accountName: "Growth Fund",
                                               balance: 15000.00)
        
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
}

extension SummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SummaryHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryCell.reuseId, for: indexPath) as! SummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

extension SummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
