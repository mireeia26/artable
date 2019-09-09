//
//  RegisterVC.swift
//  Artable
//
//  Created by MIREIA PEREZ BARROS on 09/09/2019.
//  Copyright © 2019 mpb. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var confirmPassTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var passCheck: UIImageView!
    @IBOutlet weak var confirmPassCheck: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextfield.addTarget(self, action: #selector(textFieldDidChange(textfield:)), for: UIControl.Event.editingChanged)
        confirmPassTextfield.addTarget(self, action: #selector(textFieldDidChange(textfield:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textfield: UITextField) {
        guard let password = passwordTextfield.text ,
        let confirmPassword = confirmPassTextfield.text
            else { return }
        
        passChecksShouldHide(value: false)
        if password.isEmpty || confirmPassword.isEmpty {
            passChecksShouldHide(value: true)
            return
        }
        
        updatePassChecksImages(imageName: AppImages.RedCheck)
        if password == confirmPassword {
            updatePassChecksImages(imageName: AppImages.GreenCheck)
        }
    }
    
    @IBAction func RegisterClicked(_ sender: Any) {
        guard let email = emailTextfield.text , email.isNotEmpty ,
        let username = usernameTextfield.text , username.isNotEmpty ,
        let password = passwordTextfield.text , password.isNotEmpty ,
        let confirmPass = confirmPassTextfield.text , confirmPass.isNotEmpty
            else { return }
        
        spinner.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                debugPrint(error)
                return
            }
            
            self.spinner.stopAnimating()
            print("Successfully registered new user")
        }
    }
    
    private func passChecksShouldHide(value : Bool){
        passCheck.isHidden = value
        confirmPassCheck.isHidden = value
    }
    
    private func updatePassChecksImages(imageName : String){
        passCheck.image = UIImage(named: imageName)
        confirmPassCheck.image = UIImage(named: imageName)
    }
    
}
