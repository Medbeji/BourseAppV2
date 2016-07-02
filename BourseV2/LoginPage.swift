//
//  LoginPage.swift
//  BourseV2
//
//  Created by Med Beji on 02/07/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class LoginPage : UIView  {
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"cofiblogo")
        iv.contentMode = .ScaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.redColor()
        addSubview(inputsContainerView)
        addSubview(imageView)
        addSubview(loginRegisterButton)
        setupViews()
        
    }
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(236, green: 236, blue: 236)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .System)
        button.backgroundColor = UIColor.rgb(165, green:  165, blue : 165)
        button.setTitle("Connexion via adresse e-mail", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(16)
        
        button.addTarget(self, action: #selector(handleLoginRegister), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.grayColor()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.secureTextEntry = true
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb( 220, green: 220, blue:  220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func handleLoginRegister() {
        print("connected ! ")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func settingUpInput(){
        
        inputsContainerView.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        inputsContainerView.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
        inputsContainerView.widthAnchor.constraintEqualToAnchor(widthAnchor, constant: -24).active = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraintEqualToConstant(100)
        inputsContainerViewHeightAnchor?.active = true
        
        
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        emailTextField.leftAnchor.constraintEqualToAnchor(inputsContainerView.leftAnchor, constant: 12).active = true
        emailTextField.topAnchor.constraintEqualToAnchor(inputsContainerView.topAnchor).active = true
        emailTextField.widthAnchor.constraintEqualToAnchor(inputsContainerView.widthAnchor).active = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraintEqualToAnchor(inputsContainerView.heightAnchor, multiplier: 1/2)
        emailTextFieldHeightAnchor?.active = true
        
        emailSeparatorView.leftAnchor.constraintEqualToAnchor(inputsContainerView.leftAnchor).active = true
        emailSeparatorView.topAnchor.constraintEqualToAnchor(emailTextField.bottomAnchor).active = true
        emailSeparatorView.widthAnchor.constraintEqualToAnchor(inputsContainerView.widthAnchor).active = true
        emailSeparatorView.heightAnchor.constraintEqualToConstant(1).active = true
        
        passwordTextField.leftAnchor.constraintEqualToAnchor(inputsContainerView.leftAnchor, constant: 12).active = true
        passwordTextField.topAnchor.constraintEqualToAnchor(emailTextField.bottomAnchor).active = true
        
        passwordTextField.widthAnchor.constraintEqualToAnchor(inputsContainerView.widthAnchor).active = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraintEqualToAnchor(inputsContainerView.heightAnchor, multiplier: 1/2)
        passwordTextFieldHeightAnchor?.active = true
        
        
    }
    
    func setupProfileImageView() {
        //need x, y, width, height constraints
        imageView.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        imageView.bottomAnchor.constraintEqualToAnchor(inputsContainerView.topAnchor, constant: -12).active = true
        imageView.widthAnchor.constraintEqualToAnchor(widthAnchor, constant: -24).active = true
        imageView.heightAnchor.constraintEqualToConstant(150).active = true
        
    }
    
    func setupLoginRegisterButton() {
        //need x, y, width, height constraints
        loginRegisterButton.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        loginRegisterButton.topAnchor.constraintEqualToAnchor(inputsContainerView.bottomAnchor, constant: 12).active = true
        loginRegisterButton.widthAnchor.constraintEqualToAnchor(inputsContainerView.widthAnchor).active = true
        loginRegisterButton.heightAnchor.constraintEqualToConstant(50).active = true
    }
    
    
    
    func setupViews(){
        
        backgroundColor = UIColor.rgb(241, green: 242, blue: 245)
        settingUpInput()
        setupLoginRegisterButton()
        setupProfileImageView()
    }
    
}
