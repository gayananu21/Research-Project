//
//  KnowledgeViewController.swift
//  Research_P1
//
//  Created by Gayan Disanayaka on 8/22/21.
//

import UIKit
import Lottie
import Firebase

class KnowledgeViewController: UIViewController{
   
    
  
    @IBOutlet weak var kView: UIView!
    let count = 6
    var cardView: CardView!
    
    

    var startButton: UIButton?
    
    
    @IBOutlet weak var eView: UIView!
    let lottieView = AnimationView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        addCardView()
        
        
        self.lottieView.alpha = 1
                                   self.lottieView.animation = Animation.named("Book")
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
    

    
    func addCardView() {
        
        cardView = CardView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
    
//        cardView.isOverlap = false
        kView.addSubview(cardView)
        cardView?.delegate = self
        cardView?.dataSource = self
        cardView?.reloadData()
        
    }
  

}

extension KnowledgeViewController: CardViewDelegate {
    func revoke(cardView: CardView, item: CardItem, with index: Int) {
        print("revoke index: \(index)")
    }
    
    
    func didClick(cardView: CardView, with index: Int) {
        print("click index: \(index)")
        if (index == 0){
            
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                              let VC1 = storyBoard.instantiateViewController(withIdentifier: "Emergency") as! EmergencyViewController
                        
                   
                   self.navigationController?.pushViewController(VC1, animated: true)

            
            
        }
        if (index == 1){
            
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                              let VC1 = storyBoard.instantiateViewController(withIdentifier: "Scan") as! ScanViewController
                        
                   
                   self.navigationController?.pushViewController(VC1, animated: true)

            
        }
        if (index == 2){
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                              let VC1 = storyBoard.instantiateViewController(withIdentifier: "Communicate") as! CommunicateViewController
                        
                   
                   self.navigationController?.pushViewController(VC1, animated: true)

            
            
            
        }
        if (index == 3){
            
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                              let VC1 = storyBoard.instantiateViewController(withIdentifier: "Benefits") as! BenefitsViewController
                        
                   
                   self.navigationController?.pushViewController(VC1, animated: true)

            
            
        }
    }
    
    func remove(cardView: CardView, item: CardItem, with index: Int) {
        print("remove: \(index)")
     
        if(index == 4) {
            
            cardView.reloadData()
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
}

extension KnowledgeViewController: CardViewDataSource {
    
    func numberOfItems(in cardView: CardView) -> Int {
        return count
    }
    
    func cardView(_ cardView: CardView, cellForItemAt Index: Int) -> CardItem {
        
        //序号越靠前,越在前面..0最上面.
        var item: ImageCardItem!
        if let image = UIImage(named: "img_0" + "\(Index)") {
            item = ImageCardItem(image: image)
        } else {
            item = ImageCardItem(image: UIImage.getImageWithColor(color: UIColor.randomColor))
        }
        
       
        return item
    }
    
    
    
    @objc func startAction(_ button: UIButton) {
        print("start button clicked")
        cardView.removeTopItem(with: .up)
    }
    
}




extension UIImage {
    /// 将颜色转换为图片
    static func getImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UIColor {
    //返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}


