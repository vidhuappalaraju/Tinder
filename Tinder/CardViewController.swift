//
//  CardViewController.swift
//  Tinder
//
//  Created by Vidhu Appalaraju on 10/29/18.
//  Copyright © 2018 Vidhu Appalaraju. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    var cardInitialCenter: CGPoint!
    @IBOutlet weak var profilePicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        
         self.performSegue(withIdentifier: "pictureSeg", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTouch(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            cardInitialCenter = profilePicture.center
            print("Gesture began")
        } else if sender.state == .changed {
            if(translation.x < view.center.x){
                self.profilePicture.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 180))
            }
            else{
                self.profilePicture.transform = CGAffineTransform(rotationAngle: CGFloat(-Double(translation.x) * Double.pi / 180))
            }
            print("Gesture is changing")
            
        } else if sender.state == .ended {
            UIView.animate(withDuration: 0.5) {
                print("translation \(translation)")
                if(translation.x > 50){
                    self.profilePicture.center.x += 500
                }
                else if (translation.x < -50){
                    self.profilePicture.center.x -= 500
                }
                else{
                    self.profilePicture.transform = CGAffineTransform.identity
                    print("f")
                }
            }
            print("Gesture ended")
        }
        
        
    }
    

}
