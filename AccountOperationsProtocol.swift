//
//  AccountOperationsProtocol.swift
//  ATM Model
//
//  Created by Gayathri V on 20/07/21.
//

import Foundation

protocol AccountOperations {
    func withdraw(amount : Double)
    func deposit(amount : Double)
    func swipe(amount : Double)
    func isValidAmount(amount : Double) -> Bool
    func showBalance()
}
