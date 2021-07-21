//
//  class model.swift
//  ATM Model
//
//  Created by Gayathri V on 19/07/21.
//

import Foundation

protocol BalanceChecker {
    func hasSufficientBalanceForTransaction(amount : Double) -> Bool
    func hasMinimumBalance(amount : Double) -> Bool
}




