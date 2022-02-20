//
//  ViewController.swift
//  LogInUI
//
//  Created by NAVJOT SINGH on 2022-02-16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var confirmEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmEmailLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var passwordToggle: UIButton!
    
    private var loginMode: Bool = true
    private var passwordToggleMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        confirmEmail.isHidden =  true
        confirmEmailLabel.isHidden = true
        password.isSecureTextEntry = true
    }

    @IBAction func loginregsegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 1 {
            confirmEmail.isHidden =  false
            confirmEmailLabel.isHidden = false
            loginButton.setTitle("Register", for: UIControl.State.normal)
            loginMode = false
        }else{
            confirmEmail.isHidden =  true
            confirmEmailLabel.isHidden = true
            loginButton.setTitle("Log in", for: UIControl.State.normal)
            loginMode = true
        }
    }
    
    // MARK: log out action
    @IBAction func logoutAction(_ sender: UIButton) {
    }
    
    @IBAction func forgetpasswordAction(_ sender: UIButton) {
    }
    
    
    @IBAction func passwordTogle(_ sender: UIButton) {
        
        if passwordToggleMode{
            passwordToggleMode = false
            sender.setImage(UIImage(systemName: "eye.fill"), for: UIControl.State.normal)
            password.isSecureTextEntry = false
        }else{
            passwordToggleMode = true
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: UIControl.State.normal)
            password.isSecureTextEntry = true
        }
        
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        if loginMode{
            // do login
            print("login")
            let email = email.text
            let password = password.text
            if email == "nav" && password == "1"{
                print("login success")
            }else{
                print("login fail")
            }
            
        }else{
            // register
            print("REGISTER")
            let email = email.text
            let confirmemail = confirmEmail.text
            let password = password.text
            if email == "nav" && password == "1" && confirmemail == "nav"{
                print("register success")
            }else{
                print("register fail")
            }
        }
        
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirmEmail.resignFirstResponder()
        email.text = ""
        password.text = ""
        confirmEmail.text = ""
        
    }
}

