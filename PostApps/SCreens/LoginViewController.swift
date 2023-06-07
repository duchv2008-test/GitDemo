//
//  LoginViewController.swift
//  PostApps
//
//  Created by Hà Văn Đức on 05/06/2023.
//

import UIKit

protocol LoginDisplay {
    func validateFailure(message: String)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        /**
         Khởi tại instance của AuthAPISerivce
         */
        let authAPIService = AuthAPISerivceImpl()
        
        /**
         Khởi tại instance củaAuthRepository
         */
        let authRepository = AuthRepositoryImpl(authApiService: authAPIService)
        
        /**
         Khởi tại instance LoginPresenter
         */
        presenter = LoginPresenterImpl(controller: self, authRepository: authRepository)
        super.viewDidLoad()
    }
    
    
    @IBAction func handleLoginTap(sender: UIButton) {
        let username = usernameTF.text ?? ""
        let password = passwordTF.text ?? ""
        presenter.login(username: username, password: password)
    }
}

extension LoginViewController: LoginDisplay {
    func validateFailure(message: String) {
        print(message)
    }
}
