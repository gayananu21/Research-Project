//
//  SelectViewController.swift
//  Research_P1
//
//  Created by Gayan Disanayaka on 9/7/21.
//

import UIKit
import Lottie
import Firebase


class SelectViewController: UIViewController {

    
    @IBOutlet weak var eView: UIView!
    let lottieView = AnimationView()
    
    
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var catButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        dogButton.layer.masksToBounds = false
        dogButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        dogButton.layer.borderWidth = 1
        dogButton.layer.cornerRadius = dogButton.frame.height/2
        dogButton.clipsToBounds = true
        dogButton.alpha = 1
        
       
        catButton.layer.masksToBounds = false
        catButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        catButton.layer.borderWidth = 1
        catButton.layer.cornerRadius = catButton.frame.height/2
        catButton.clipsToBounds = true
        catButton.alpha = 1
        
        
        
        
        self.lottieView.alpha = 1
                                   self.lottieView.animation = Animation.named("sTag")
                                   //let lottieView = AnimationView(animation: loadingAnimation)
                                       // 2. SECOND STEP (Adding and setup):
        eView.addSubview(self.lottieView)
                                   self.lottieView.contentMode = .scaleAspectFit
                                   self.lottieView.loopMode = .autoReverse
                                   self.lottieView.play(toFrame: .infinity)
                                   
                                   
                                   
                                       // 3. THIRD STEP (LAYOUT PREFERENCES):
                                   self.lottieView.translatesAutoresizingMaskIntoConstraints = false
                                       NSLayoutConstraint.activate([
                                           self.lottieView.leftAnchor.constraint(equalTo: eView.leftAnchor),
                                           self.lottieView.rightAnchor.constraint(equalTo: eView.rightAnchor),
                                           self.lottieView.topAnchor.constraint(equalTo: eView.topAnchor),
                                           self.lottieView.bottomAnchor.constraint(equalTo: eView.bottomAnchor)
                                       ])
 
        
    }
    

    @IBAction func onTappedCat(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                          let VC1 = storyBoard.instantiateViewController(withIdentifier: "HOME_TAB") as! HomeTabViewController
                    
        VC1.modalPresentationStyle = .fullScreen
                                     VC1.petType = "Dog"
                                     
    
        
                self.present(VC1, animated: true, completion: nil)
    }
    
    @IBAction func onTappedDog(_ sender: Any) {
       
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                          let VC1 = storyBoard.instantiateViewController(withIdentifier: "HOME_TAB") as! HomeTabViewController
                    
                     
        VC1.modalPresentationStyle = .fullScreen
                                     VC1.petType = "Cat"
                                     
    
        
                self.present(VC1, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.setNavigationBarHidden(true, animated: animated)
          
          
      }

      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          navigationController?.setNavigationBarHidden(true, animated: animated)
      }
    
}
