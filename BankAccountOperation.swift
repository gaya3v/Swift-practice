//
//  Transaction.swift
//  ATM Model
//
//  Created by Gayathri V on 20/07/21.
//

import Foundation
class Account : AccountOperations, TransactionCharge, BalanceChecker {
    var accountNumber : [Int]
    var accountHolderName : String
    var balance : Double
    var creditCard : [CreditCard]
    var debitCard : [DebitCard]
    
    init (accountNumber : [Int], accountHolderName : String, balance : Double, creditCard : [CreditCard], debitCard : [DebitCard]) {
        self.accountNumber = accountNumber
        self.accountHolderName = accountHolderName
        self.balance = balance
        self.creditCard = creditCard
        self.debitCard = debitCard
    }
    func hasMinimumBalance(amount : Double) -> Bool {
        if balance<100 {
            return false
        }
        return true
    }
    
    func hasSufficientBalanceForTransaction(amount: Double) -> Bool {
        if amount > balance {
            return false
        }
        return true
    }
    
    func cashback(amount: Double) -> Double {
        let bonus = amount * 0.01
        print("Cashback on Swiping - USD $",bonus)
        return bonus
    }
    
    func taxCharges(amount: Double) -> Double {
        if amount > 100 {
            let reductionAmt = amount * 0.04
            print("Transaction Charges - USD $",reductionAmt)
            return reductionAmt
        }
        else {
            let reductionAmt = amount * 0.02
            print("Transaction Charges - USD $",reductionAmt)
            return reductionAmt
        }
    }
    
    func withdraw(amount: Double) {
        if hasSufficientBalanceForTransaction(amount: amount) {
            if isValidAmount(amount: amount) {
                print("Withdraw amount - USD $",amount)
                balance -= amount
                let charges = taxCharges(amount: amount)
                balance -= charges
                print("Balance in account after withdrawal is USD $",balance)
            }
            else {
                print("Enter amount in terms of USD $5")
            }
        }
        else {
            print("Insufficient funds for transaction")
        }
    }
    
    func deposit(amount: Double) {
        print("Deposit amount - USD ",amount)
        balance += amount
        print("Balance in account after deposit is USD $",balance)
    }
    
    func swipe(amount: Double) {
        if hasSufficientBalanceForTransaction(amount: amount) {
            if isValidAmount(amount: amount) {
                print("Swipe amount - USD $",amount)
                balance -= amount
                let bonus = cashback(amount: amount)
                balance+=bonus
                print("Balance in account after cashback is USD $",balance)
            }
            else {
                print("Enter amount in terms of USD $5")
            }
        }
        else {
            print("Insufficient funds for transaction")
        }
    }
    
    func showBalance() {
        print("BALANCE : USD $",balance)
    }
    
    func isValidAmount(amount: Double) -> Bool {
        if amount.truncatingRemainder(dividingBy: 5.0) == 0 {
            return true
        }
        return false
    }
    
}


