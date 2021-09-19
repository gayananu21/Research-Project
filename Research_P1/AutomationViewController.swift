//
//  AutomationViewController.swift
//  Research_P1
//
//  Created by Gayan Disanayaka on 8/23/21.
//

import UIKit
import Lottie
import Firebase

class AutomationViewController: UIViewController {
    
    @IBOutlet weak var eView: UIView!
    let lottieView = AnimationView()
    
    //All Morning Scene
    @IBOutlet weak var AMV01: UIView!
    @IBOutlet weak var AMB01: UIButton!
    
    @IBOutlet weak var AMV02: UIView!
    @IBOutlet weak var AMB02: UIButton!

    @IBOutlet weak var AMV03: UIView!
    @IBOutlet weak var AMB03: UIButton!
    
    @IBOutlet weak var AMV04: UIView!
    @IBOutlet weak var AMB04: UIButton!
    
    @IBOutlet weak var AMV05: UIView!
    @IBOutlet weak var AMB05: UIButton!
    
    //All Afternoon Scene
    @IBOutlet weak var AAV01: UIView!
    @IBOutlet weak var AAB01: UIButton!
    
    @IBOutlet weak var AAV02: UIView!
    @IBOutlet weak var AAB02: UIButton!

    @IBOutlet weak var AAV03: UIView!
    @IBOutlet weak var AAB03: UIButton!
    
    @IBOutlet weak var AAV04: UIView!
    @IBOutlet weak var AAB04: UIButton!
    
    @IBOutlet weak var AAV05: UIView!
    @IBOutlet weak var AAB05: UIButton!
    
    //All Evening Scene
    @IBOutlet weak var AEV01: UIView!
    @IBOutlet weak var AEB01: UIButton!
    
    @IBOutlet weak var AEV02: UIView!
    @IBOutlet weak var AEB02: UIButton!

    @IBOutlet weak var AEV03: UIView!
    @IBOutlet weak var AEB03: UIButton!
    
    @IBOutlet weak var AEV04: UIView!
    @IBOutlet weak var AEB04: UIButton!
    
    @IBOutlet weak var AEV05: UIView!
    @IBOutlet weak var AEB05: UIButton!
    
    
    // Morning Scene
    @IBOutlet weak var MV01: UIView!
    @IBOutlet weak var MB01: UIButton!
    
    @IBOutlet weak var MV02: UIView!
    @IBOutlet weak var MB02: UIButton!

    @IBOutlet weak var MV03: UIView!
    @IBOutlet weak var MB03: UIButton!
    
    @IBOutlet weak var MV04: UIView!
    @IBOutlet weak var MB04: UIButton!
    
    @IBOutlet weak var MV05: UIView!
    @IBOutlet weak var MB05: UIButton!
    
    
    //Afternoon Scene
    @IBOutlet weak var AV01: UIView!
    @IBOutlet weak var AB01: UIButton!
    
    @IBOutlet weak var AV02: UIView!
    @IBOutlet weak var AB02: UIButton!

    @IBOutlet weak var AV03: UIView!
    @IBOutlet weak var AB03: UIButton!
    
    @IBOutlet weak var AV04: UIView!
    @IBOutlet weak var AB04: UIButton!
    
    @IBOutlet weak var AV05: UIView!
    @IBOutlet weak var AB05: UIButton!
    
    
    //Evening Scene
    @IBOutlet weak var EV01: UIView!
    @IBOutlet weak var EB01: UIButton!
    
    @IBOutlet weak var EV02: UIView!
    @IBOutlet weak var EB02: UIButton!

    @IBOutlet weak var EV03: UIView!
    @IBOutlet weak var EB03: UIButton!
    
    @IBOutlet weak var EV04: UIView!
    @IBOutlet weak var EB04: UIButton!
    
    @IBOutlet weak var EV05: UIView!
    @IBOutlet weak var EB05: UIButton!
    
    
    // Favourite Scene
    @IBOutlet weak var FV01: UIView!
    @IBOutlet weak var FB01: UIButton!
    
    @IBOutlet weak var FV02: UIView!
    @IBOutlet weak var FB02: UIButton!

    @IBOutlet weak var FV03: UIView!
    @IBOutlet weak var FB03: UIButton!
    
    @IBOutlet weak var FV04: UIView!
    @IBOutlet weak var FB04: UIButton!
    
    @IBOutlet weak var FV05: UIView!
    @IBOutlet weak var FB05: UIButton!
    
    let ref=Database.database().reference()
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lottieView.alpha = 1
                                   self.lottieView.animation = Animation.named("Dog_H")
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
    //All Morning Scene button actions
    @IBAction func AMB01(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command01/state").setValue("ON")
        
        self.AMV01.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.AMB01.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AMV01.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.AMB01.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command01/state").setValue("OFF")
            
    }
        
        
        
    }
    
    @IBAction func AMB02(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command02/state").setValue("ON")
        self.AMV02.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.AMB02.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AMV02.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.AMB02.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command02/state").setValue("OFF")
    }
   
        
    }
    
    @IBAction func AMB03(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command03/state").setValue("ON")
        self.AMV03.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.AMB03.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AMV03.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.AMB03.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command03/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AMB04(_ sender: Any) {
        ref.child("Voice Commands/Morning/Command04/state").setValue("ON")
        
        self.AMV04.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.AMB04.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AMV04.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.AMB04.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command04/state").setValue("OFF")
            
    }
        
    }
    
    @IBAction func AMB05(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command05/state").setValue("ON")
        
        self.AMV05.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.AMB05.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AMV05.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.AMB05.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command05/state").setValue("OFF")
            
    }
        
    }
    
    
    //All Afternoon Scene button actions
    @IBAction func AAB01(_ sender: Any) {
        ref.child("Voice Commands/Afternoon/Command01/state").setValue("ON")
        
        self.AAV01.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AAB01.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AAV01.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AAB01.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command01/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AAB02(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command02/state").setValue("ON")
        self.AAV02.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AAB02.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AAV02.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AAB02.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command02/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AAB03(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command03/state").setValue("ON")
        
        self.AAV03.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AAB03.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AAV03.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AAB03.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command03/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AAB04(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command04/state").setValue("ON")
        
        self.AAV04.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AAB04.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AAV04.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AAB04.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command04/state").setValue("OFF")
            
    }
        
    }
    
    @IBAction func AAB05(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command05/state").setValue("ON")
        
        self.AAV05.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AAB05.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AAV05.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AAB05.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command05/state").setValue("OFF")
            
    }
        
    }
    
    //All Evening Scene button actions
    @IBAction func AEB01(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command01/state").setValue("ON")
        
        self.AEV01.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.AEB01.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AEV01.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.AEB01.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command01/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AEB02(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command02/state").setValue("ON")
        
        self.AEV02.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.AEB02.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AEV02.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.AEB02.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command02/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AEB03(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command03/state").setValue("ON")
        
        self.AEV03.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.AEB03.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AEV03.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.AEB03.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command03/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AEB04(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command04/state").setValue("ON")
        
        self.AEV04.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.AEB04.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AEV04.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.AEB04.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command04/state").setValue("OFF")
            
    }
        
    }
    
    @IBAction func AEB05(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command05/state").setValue("ON")
        
        self.AEV05.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.AEB05.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AEV05.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.AEB05.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command05/state").setValue("OFF")
            
    }
   
        
    }
    
    
    //Morning Scene button actions
    @IBAction func MB01(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command01/state").setValue("ON")
        self.MV01.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.MB01.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.MV01.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.MB01.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command01/state").setValue("OFF")
            
    }
        
    }
    
    @IBAction func MB02(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command02/state").setValue("ON")
        
        self.MV02.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.MB02.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.MV02.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.MB02.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command02/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func MB03(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command03/state").setValue("ON")
        
        self.MV03.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.MB03.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.MV03.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.MB03.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command03/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func MB04(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command04/state").setValue("ON")
        
        self.MV04.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.MB04.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.MV04.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.MB04.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command04/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func MB05(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command05/state").setValue("ON")
        
        self.MV05.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.MB05.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.MV05.backgroundColor = #colorLiteral(red: 0.8327578902, green: 0.9971920848, blue: 1, alpha: 1)
            self.MB05.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command05/state").setValue("OFF")
            
    }
   
        
    }
    

    //Afternoon Scene button actions
    @IBAction func AB01(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command01/state").setValue("ON")
        
        self.AV01.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AB01.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AV01.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AB01.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command01/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AB02(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command02/state").setValue("ON")
        
        self.AV02.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AB02.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AV02.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AB02.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command02/state").setValue("OFF")
            
    }
        
    }
    
    @IBAction func AB03(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command03/state").setValue("ON")
        
        self.AV03.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AB03.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AV03.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AB03.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command03/state").setValue("OFF")
            
    }
        
    }
    
    @IBAction func AB04(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command04/state").setValue("ON")
        
        self.AV04.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AB04.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AV04.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AB04.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command04/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func AB05(_ sender: Any) {
        
        ref.child("Voice Commands/Afternoon/Command05/state").setValue("ON")
        
        self.AV05.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.AB05.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.AV05.backgroundColor = #colorLiteral(red: 0.9998069406, green: 0.9952650666, blue: 0.8368387818, alpha: 1)
            self.AB05.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Afternoon/Command05/state").setValue("OFF")
            
    }
   
        
    }
    
    
    //Evening Scene button actions
    @IBAction func EB01(_ sender: Any) {
        
        
        ref.child("Voice Commands/Evening/Command01/state").setValue("ON")
        
        self.EV01.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.EB01.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.EV01.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.EB01.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command01/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func EB02(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command02/state").setValue("ON")
        
        self.EV02.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.EB02.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.EV02.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.EB02.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command02/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func EB03(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command03/state").setValue("ON")
        
        self.EV03.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.EB03.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.EV03.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.EB03.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command03/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func EB04(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command04/state").setValue("ON")
        
        self.EV04.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.EB04.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.EV04.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.EB04.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command04/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func EB05(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command05/state").setValue("ON")
        
        self.EV05.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.EB05.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.EV05.backgroundColor = #colorLiteral(red: 0.8325170875, green: 0.9924197793, blue: 0.8371630907, alpha: 1)
            self.EB05.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command05/state").setValue("OFF")
            
    }
   
        
    }
    
    //Favaurite Scene button actions
    @IBAction func FB01(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command02/state").setValue("ON")
        self.FV01.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        self.FB01.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.FV01.backgroundColor = #colorLiteral(red: 1, green: 0.8409949541, blue: 0.8371030092, alpha: 1)
            self.FB01.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command02/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func FB02(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command03/state").setValue("ON")
        
        self.FV02.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        self.FB02.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.FV02.backgroundColor = #colorLiteral(red: 1, green: 0.8409949541, blue: 0.8371030092, alpha: 1)
            self.FB02.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command03/state").setValue("OFF")
            
    }
        
    }
    
    @IBAction func FB03(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command05/state").setValue("ON")
        
        self.FV03.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        self.FB03.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.FV03.backgroundColor = #colorLiteral(red: 1, green: 0.8409949541, blue: 0.8371030092, alpha: 1)
            self.FB03.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command05/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func FB04(_ sender: Any) {
        
        ref.child("Voice Commands/Morning/Command01/state").setValue("ON")
        
        self.FV04.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        self.FV04.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.FV04.backgroundColor = #colorLiteral(red: 1, green: 0.8409949541, blue: 0.8371030092, alpha: 1)
            self.FV04.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Morning/Command01/state").setValue("OFF")
            
    }
   
        
    }
    
    @IBAction func FB05(_ sender: Any) {
        
        ref.child("Voice Commands/Evening/Command01/state").setValue("ON")
        
        self.FV05.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        self.FB05.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+6 ) {

          self.FV05.backgroundColor = #colorLiteral(red: 1, green: 0.8409949541, blue: 0.8371030092, alpha: 1)
            self.FB05.tintColor = UIColor.lightGray
            self.ref.child("Voice Commands/Evening/Command01/state").setValue("OFF")
            
    }
   
        
    }
    @IBAction func onScan(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HOME_TAB")
         vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
