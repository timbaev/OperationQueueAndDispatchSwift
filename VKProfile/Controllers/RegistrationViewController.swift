//
//  RegistrationViewController.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 30.10.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var maleCheckbox: CheckBox!
    @IBOutlet weak var femaleCheckBox: CheckBox!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    //MARK: - main methods
    
    @IBAction func onRegisterClick(_ sender: UIButton) {
        guard let name = nameTextField.text else {
            nameTextField.shake()
            return
        }
        guard let surname = surnameTextField.text else {
            surnameTextField.shake()
            return
        }
        guard let email = emailTextField.text else {
            emailTextField.shake()
            return
        }
        guard let phoneNumber = phoneNumberTextField.text else {
            phoneNumberTextField.shake()
            return
        }
        guard let ageText = ageTextField.text, let age = Int(ageText) else {
            ageTextField.shake()
            return
        }
        guard let city = cityTextField.text else {
            cityTextField.shake()
            return
        }
        guard let password = passwordTextField.text else {
            passwordTextField.shake()
            return
        }
        
        let userVK = UserVK(name: name, surname: surname, email: email, phoneNumber: phoneNumber, age: age, city: city, password: password)
        UserRepository.instance.register(userVK)
    }
    
    
    @IBAction func maleChecked(_ sender: CheckBox) {
        sender.isChecked = true
        femaleCheckBox.isChecked = false
    }
    
    @IBAction func femaleChecked(_ sender: CheckBox) {
        sender.isChecked = true
        maleCheckbox.isChecked = false
    }
}
