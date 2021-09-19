//
//  LoginScreenViewController.swift
//  Café-Nibm
//
//  Created by Gayan Disanayaka on 2/22/21.
//  Copyright © 2021 Gayan Disanayaka. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FBSDKLoginKit
import CoreLocation



class LoginScreenViewController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate{
    
     private var locationManager: CLLocationManager?

    @IBOutlet weak var secoundView: UIView!
    @IBOutlet weak var darkTextLabel: UHBCustomLabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var shinyTextLabel: UHBCustomLabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: FBLoginButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        
        
        
        
        
        
        
        
       scrollView.delegate = self
        
       self.emailTextField.addBottomBorder()
       self.passwordTextField.addBottomBorder()
        
        
        
        //Looks for single or multiple taps.
       let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        
               //add Shimmer effect to logo text
        
               darkTextLabel.textColor = .black
               secoundView.addSubview(darkTextLabel)
               
               shinyTextLabel.textColor = .orange
               shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
               shinyTextLabel.textAlignment = .center
               
               secoundView.addSubview(shinyTextLabel)
               
               
               
               let gradientLayer = CAGradientLayer()
               gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
               gradientLayer.locations = [0, 0.5, 1]
               gradientLayer.frame = shinyTextLabel.frame
               
               let angle = 45 * CGFloat.pi / 100
               gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
               
               shinyTextLabel.layer.mask = gradientLayer
               
               let animation = CABasicAnimation(keyPath: "transform.translation.x")
               animation.duration = 2
               animation.fromValue = -view.frame.width
               animation.toValue = view.frame.width
               animation.repeatCount = Float.infinity
               
               gradientLayer.add(animation, forKey: "just some key")
        
        
            
        
        }
    
    
   
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["fields": "email, name"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        request.start(completionHandler: {connection, result, error in
            
            print("\(result)")
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    
    //Hide navigation bar when top and show navigation bar when scrolling down.
    
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if (scrollView.contentOffset.y < 0) {
                // Move UP - Show Navigation Bar
                
                UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseOut, animations: {
                               
                                                   self.navigationController?.setNavigationBarHidden(true, animated: true)
                                                }, completion: nil)
            } else if (scrollView.contentOffset.y > 0) {
                 UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseIn, animations: {
                                              
                                                                  self.navigationController?.setNavigationBarHidden(false, animated: true)
                                                               }, completion: nil)
                
            }
        }
    

    //Calls this function when the tap is recognized to dismiss keyboard
    
    @objc func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
           
    }
    
  
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginClicked(_ sender: Any) {
        
        self.errorLabel.alpha = 1
        let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
          
         
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
              if let error = error as? NSError {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    self.errorLabel.text = "Please enable Firebase Sign in method"
                  // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
                case .userDisabled:
                    self.errorLabel.text = "Your account has been disabled by an administrator"
                  // Error: The user account has been disabled by an administrator.
                case .wrongPassword:
                    self.errorLabel.text = "The password is invalid or the user does not have a password"
                  // Error: The password is invalid or the user does not have a password.
                case .invalidEmail:
                    self.errorLabel.text = "Please enter a valid email address"
                  // Error: Indicates the email address is malformed.
                default:
                    self.errorLabel.text = "Unable to Sign up"
                    print("Error: \(error.localizedDescription)")
                }
              } else {
                
                self.errorLabel.text = "User signs in successfully"
                print("User signs in successfully")
                let userInfo = Auth.auth().currentUser
                let email = userInfo?.email
                
                
                func isUserLoggedIn() -> Bool {
                  return Auth.auth().currentUser != nil
                }
                if (isUserLoggedIn() == true) {
                    // Show logout page
                   
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                                      let VC1 = storyBoard.instantiateViewController(withIdentifier: "Select") as! SelectViewController
                   

                     self.navigationController?.navigationBar.alpha = 0
                    
                           self.navigationController?.pushViewController(VC1, animated: true)
               
                    
                  } else {
                    // Show login page
                    
                   
                  }
              }
                
                
            }
        }
        
    
}




//Here we can add bottom line to UITextField

extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: 1200, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}

