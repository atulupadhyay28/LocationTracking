//
//  LoginVC.swift
//  LocationTracking
//
//  Created by Atul Upadhyay on 18/04/23.
//

import Foundation
import UIKit

class LoginVC: UIViewController, UITextFieldDelegate, UIScrollViewDelegate{
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
       
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width), height: 850)
        loginView()
        
    }
    
    
    
    
    
    func loginView() {
        //emailTextField
        emailTextField.backgroundColor = .clear
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Please enter your email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = .always
        emailTextField.rightView = paddingView
        emailTextField.rightViewMode = .always
        emailTextField.layer.cornerRadius = 30.0
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.borderColor = (UIColor.white).cgColor
        emailTextField.layer.borderWidth = 1.0
        //passwordTextField        //
        let paddingView1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        passwordTextField.backgroundColor = .clear
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your password.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.leftView = paddingView1
        passwordTextField.leftViewMode = .always
        passwordTextField.rightView = paddingView1
        passwordTextField.rightViewMode = .always
        passwordTextField.layer.cornerRadius = 30.0
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderColor = (UIColor.white).cgColor
        passwordTextField.layer.borderWidth = 1.0
        //login button
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderColor = (UIColor.white).cgColor
        loginButton.layer.borderWidth = 1.0
        loginButton.setTitle("Login", for: .normal)
    }
    
    
    
    @IBAction func loginButtonClicked(_ sender: UIButton!) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let homeVC = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        appDelegate.window!.rootViewController = homeVC
        
    }
    
    
    
    
    
    
}

