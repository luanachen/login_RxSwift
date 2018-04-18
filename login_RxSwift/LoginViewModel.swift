//
//  LoginViewModel.swift
//  login_RxSwift
//
//  Created by Luana on 18/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {

    var username = BehaviorSubject<String>(value: "")
    var password = BehaviorSubject<String>(value: "")

    // Computed property to return the result of expected validation
    var isValid : Observable <Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()){ usernameString, passwordString in
            usernameString.count >= 4 && passwordString.count >= 4
        }
    }
}
