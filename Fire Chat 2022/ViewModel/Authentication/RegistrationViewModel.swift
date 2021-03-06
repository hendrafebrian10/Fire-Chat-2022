//
//  RegistrationViewModel.swift
//  Fire Chat 2022
//
//  Created by hendra febrian on 07/07/22.
//

import Foundation

struct RegistartionViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false
            && password?.isEmpty == false
            && fullname?.isEmpty == false
            && username?.isEmpty == false
    }
}
