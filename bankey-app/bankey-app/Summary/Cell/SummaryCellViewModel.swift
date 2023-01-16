//
//  SummaryCellViewModel.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/16/23.
//

import UIKit

struct SummaryCellViewModel {
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    let accountType: AccountType
    let accountName: String
    let balance: Decimal
    
//    var balanceAttributedText: AttributedString { return }
}
