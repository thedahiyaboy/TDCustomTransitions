//
//  ViewController.swift
//  TDCustomTrans
//
//  Created by dahiyaboy on 05/03/18.
//  Copyright © 2018 dahiyaboy. All rights reserved.
//

import UIKit

let herbs = HerbModel.all()

class ViewController: UIViewController , UIViewControllerTransitioningDelegate{

    @IBOutlet var listView: UIScrollView!
    @IBOutlet var bgImage: UIImageView!
    
    var selectedImage: UIImageView?
    let transition = PopAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // handler when presented VC is dismissed.
        // Show the image that is selected.
        transition.dismissCompletion = {
            self.selectedImage!.isHidden = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if listView.subviews.count < herbs.count {
            listView.viewWithTag(0)?.tag = 1000 //prevent confusion when looking up images
            setupList()
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    //MARK: View setup
    
    //add all images to the list
    func setupList() {
        
        let listHeight = listView.frame.height
        let itemHeight: CGFloat = listHeight //* 1.33
        let aspectRatio = UIScreen.main.bounds.height / UIScreen.main.bounds.width
        let itemWidth: CGFloat = 100 //itemHeight / aspectRatio
        
        let horizontalPadding: CGFloat = 10.0
        
        for i in herbs.indices {
            
            //create image view
            let imageView  = UIImageView(image: UIImage(named: herbs[i].image))
            imageView.tag = i
            imageView.contentMode = .scaleAspectFill
            imageView.isUserInteractionEnabled = true
            imageView.layer.cornerRadius = 20.0
            imageView.layer.masksToBounds = true
            listView.addSubview(imageView)
            
            //attach tap detector
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImageView)))
            
            // Set image position in scrollview.
            imageView.frame = CGRect(
                x: CGFloat(i) * itemWidth + CGFloat(i+1) * horizontalPadding,
                y: 0.0,
                width: itemWidth,
                height: itemHeight)
            
        }
        
        listView.contentSize = CGSize(
            width: CGFloat(herbs.count) * (itemWidth + horizontalPadding) + horizontalPadding,
            height:  0)
        
        listView.backgroundColor = UIColor.clear

    }
    
    //MARK: Actions
    
    // Image view tapped.
    @objc func didTapImageView(_ tap: UITapGestureRecognizer) {
        selectedImage = tap.view as? UIImageView

        let index = tap.view!.tag
        let selectedHerb = herbs[index]

        //present details view controller
        let herbDetails = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        herbDetails.transitioningDelegate = self
        herbDetails.herb = selectedHerb
        present(herbDetails, animated: true, completion: nil)
    }
}

// Transition animation delegates
extension ViewController{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame =
            selectedImage!.superview!.convert(selectedImage!.frame, to: nil)
        transition.presenting = true 
        selectedImage!.isHidden = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
    
}
