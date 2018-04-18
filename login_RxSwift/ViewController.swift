//
//  ViewController.swift
//  login_RxSwift
//
//  Created by Luana on 18/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var validationsLabel: UILabel!

    var loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor.lightGray

        // Bind UI textFields to properties in ViewModel
        _ = usernameTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.username)

        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.password)

        _ = loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.validationsLabel.text = isValid ? "Enabled" : "Disabled"
            self.validationsLabel.textColor = isValid ? .green : .red

            print(isValid)
            
            self.loginButton.isEnabled = isValid ? true : false
            self.loginButton.backgroundColor = isValid ? UIColor.orange : UIColor.lightGray
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

