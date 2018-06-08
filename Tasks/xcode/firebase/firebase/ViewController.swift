//
//  ViewController.swift
//  firebase
//
//  Created by Margaro on 05/05/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController, UITextFieldDelegate {
  
  var ref: DatabaseReference! = nil
  
  let formContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 10
    view.layer.masksToBounds = true
    return view
  }()
  
  let registerButton: UIButton = {
    let btn = UIButton(type: .system)
    btn.backgroundColor = UIColor(red: 232 / 255, green: 173 / 255, blue: 72 / 255, alpha: 1.0)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitleColor(UIColor.white, for: .normal)
    btn.setTitle("Registro", for: .normal)
    
    btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    btn.layer.cornerRadius = 10
    btn.layer.masksToBounds = true
    
//    Methods
    btn.addTarget(self, action: #selector(loginRegister), for: .touchUpInside)
    
    return btn
  }()
  
  let emailTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Corre electrónico"
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  let passwordTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Contraseña"
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.isSecureTextEntry = true
    return tf
  }()
  
  let formSegmentedControl: UISegmentedControl = {
    let sg = UISegmentedControl(items: ["Login", "Registro"])
    sg.translatesAutoresizingMaskIntoConstraints = false
    sg.selectedSegmentIndex = 1
    sg.tintColor = UIColor.white
    
    sg.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
    return sg
  }()
  
  @objc func segmentedChange() {
    let title = formSegmentedControl.titleForSegment(at: formSegmentedControl.selectedSegmentIndex)
    registerButton.setTitle(title, for: .normal)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 30/255, green: 62/255, blue: 106/255, alpha: 1)
    self.ref = Database.database().reference()
    setupLayout()
  }
  
  func setupLayout() {
    view.addSubview(formContainerView)
    view.addSubview(registerButton)
    
    emailTextField.delegate = self
    passwordTextField.delegate = self
    
    formContainerView.addSubview(emailTextField)
    formContainerView.addSubview(passwordTextField)
    
    view.addSubview(formSegmentedControl)
    
    formContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    formContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    formContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
    formContainerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    
//    Register button
    registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    registerButton.topAnchor.constraint(equalTo: formContainerView.bottomAnchor, constant: 15).isActive = true
    registerButton.widthAnchor.constraint(equalTo: formContainerView.widthAnchor).isActive = true
    
//    email and password
    emailTextField.leftAnchor.constraint(equalTo: formContainerView.leftAnchor, constant: 10).isActive = true
    emailTextField.topAnchor.constraint(equalTo: formContainerView.topAnchor).isActive = true
    emailTextField.widthAnchor.constraint(equalTo: formContainerView.widthAnchor).isActive = true
    emailTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    passwordTextField.leftAnchor.constraint(equalTo: formContainerView.leftAnchor, constant: 10).isActive = true
    passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
    passwordTextField.widthAnchor.constraint(equalTo: formContainerView.widthAnchor).isActive = true
    passwordTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    formSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    formSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
    formSegmentedControl.bottomAnchor.constraint(equalTo: formContainerView.topAnchor,  constant: -15).isActive = true
    formSegmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
  }
  
  @objc func loginRegister() {
    if formSegmentedControl.selectedSegmentIndex == 0 {
      loginUser()
    } else {
      registerUser()
    }
  }
  
  func loginUser() {
    if let email = emailTextField.text, let password = passwordTextField.text {
      Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
        if user != nil {
          print("Usuario authenticado")
          let lc = LoginViewController()
          self.navigationController?.pushViewController(lc, animated: true)
        } else {
          if let error = error?.localizedDescription {
            print("Error al iniciar sesion por firebase", error)
          } else {
            print("Tu eres el error en sesion")
          }
        }
      }
    }
  }
  
  
  func registerUser() {
    if let email = emailTextField.text, let password = passwordTextField.text {
      Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
        if user != nil {
          print("Se creo el usuario")
          let values = ["name": email]
          
          self.ref.updateChildValues(values, withCompletionBlock: { (error, ref) in
            if error != nil {
              print("Error al insertar datos")
              return
            }
            
            print("Dato guardado en la BD")
          })
          
        } else {
          if let error = error?.localizedDescription {
            print("Error al crear usuario por firebase", error)
          } else {
            print("Tu eres el error!!")
          }
        }
      }
    }
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
