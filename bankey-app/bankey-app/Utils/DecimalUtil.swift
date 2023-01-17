//
//  DecimalUtil.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/16/23.
//

import UIKit

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
