//
//  ATM.swift
//  ATM Model
//
//  Created by Gayathri V on 20/07/21.
//

import Foundation

class ATM {
    let id : Int
    let branchName : String
    let bankName : String
    
    init (id : Int, branchName : String, bankName : String) {
        self.id = id
        self.bankName = bankName
        self.branchName = branchName
    }
}
