//
//  ViewController.swift
//  DoubleTap
//
//  Created by Nilesh Kumar on 22/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var myImageView: UIImageView = {
        
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(named: "image1")
        myImageView.isUserInteractionEnabled = true
        return myImageView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImageView)
       
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
        myImageView.center = view.center
        
        let myTap = UITapGestureRecognizer(target: self, action: #selector(tapsAdded(_:)))
        myTap.numberOfTapsRequired = 2
        myImageView.addGestureRecognizer(myTap)
    }
    
    @objc func tapsAdded(_ gesture: UITapGestureRecognizer){
        
        guard let gestureView = gesture.view else {return}
        
        let heart = UIImageView(image: UIImage(systemName: "heart.fill"))
        
        let size = gestureView.frame.size.width / 4
        
        heart.frame = CGRect(x: (gestureView.frame.size.width - size) / 2, y: (gestureView.frame.size.height - size) / 2, width: size, height: size)
        heart.tintColor = .red
        gestureView.addSubview(heart)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 0.5, animations: {
                heart.alpha = 0
            }) { done in
                heart.removeFromSuperview()
            }
        }
    }

}

