//
//  DetailVC.swift
//  TDCustomTrans
//
//  Created by dahiyaboy on 05/03/18.
//  Copyright © 2018 dahiyaboy. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var titleView: UILabel!
    
    var herb: HerbModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.image = UIImage(named: herb.image)
        titleView.text = herb.name
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
    }
    
    @objc func actionClose(_ tap: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
