//
//  LoginViewModel.swift
//  Fire Chat 2022
//
//  Created by hendra febrian on 07/07/22.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
}
