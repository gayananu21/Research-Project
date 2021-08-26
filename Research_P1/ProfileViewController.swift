//
//  ProfileViewController.swift
//  Research_P1
//
//  Created by Gayan Disanayaka on 8/22/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var noScans: UILabel!
    @IBOutlet weak var noAbnormals: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
      @IBOutlet weak var kView: UIView!
      let count = 6
      var cardView: CardView!
      
      

      var startButton: UIButton?
      

      override func viewDidLoad() {
          super.viewDidLoad()

    
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.alpha = 1
        
        noScans.layer.cornerRadius = noScans.frame.height/2
        noScans.clipsToBounds = true
        noScans.alpha = 1
        
        noAbnormals.layer.cornerRadius = noAbnormals.frame.height/2
        noAbnormals.clipsToBounds = true
        noAbnormals.alpha = 1
     
      }
      

      
      func addCardView() {
          
          cardView = CardView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
          cardView.center = view.center
  //        cardView.isOverlap = false
          view.addSubview(cardView)
          cardView?.delegate = self
          cardView?.dataSource = self
          cardView?.reloadData()
          
      }
    

  }

  extension ProfileViewController: CardViewDelegate {
      func revoke(cardView: CardView, item: CardItem, with index: Int) {
          print("revoke index: \(index)")
      }
      
      
      func didClick(cardView: CardView, with index: Int) {
          print("click index: \(index)")
      }
      
      func remove(cardView: CardView, item: CardItem, with index: Int) {
          print("remove: \(index)")
       
          if(index == 4) {
              
              cardView.reloadData()
              
          }
      }
      
      
  }

  extension ProfileViewController: CardViewDataSource {
      
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




