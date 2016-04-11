//
//  NewViewController.swift
//  CollectionTuts
//
//  Created by Luisito Yumang on 4/9/16.
//  Copyright © 2016 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import Material

class NewViewController: UIViewController {

    @IBOutlet weak var navigationBarView: NavigationBarView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var navigationBarViewHeightConstraint: NSLayoutConstraint!
    var image = UIImage()
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        // If landscape.
        if UIInterfaceOrientationIsLandscape(toInterfaceOrientation) {
            /**
             The height of the NavigationBarView is dependant on the device being used.
             If the device is an iPad, the height should stay the same as in Portrait
             view, otherwise it should strink to the Landscape height for iPhone.
             */
            navigationBarViewHeightConstraint?.constant = .iPad == MaterialDevice.type ? navigationBarView!.heightForPortraitOrientation :  navigationBarView!.heightForLandscapeOrientation
        } else {
            navigationBarViewHeightConstraint?.constant = navigationBarView!.heightForPortraitOrientation
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.image
        
        prepareNavigationBarView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /// Prepare the navigationBarView.
    func prepareNavigationBarView() {
        // Stylize.
        navigationBarView.backgroundColor = MaterialColor.lightBlue.darken1
        
        // To lighten the status bar add the "View controller-based status bar appearance = NO"
        // to your info.plist file and set the following property.
        navigationBarView.statusBarStyle = .Default
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Material"
        titleLabel.textAlignment = .Left
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.regular
        navigationBarView.titleLabel = titleLabel
        
        // Menu button.
        let img1: UIImage? = UIImage(named: "back")
        let btn1: FlatButton = FlatButton()
        btn1.pulseScale = false
        btn1.setImage(img1, forState: .Normal)
        btn1.setImage(img1, forState: .Highlighted)
        btn1.addTarget(self, action: #selector(self.back), forControlEvents: .TouchUpInside)
        
        
        // Add buttons to left side.
        navigationBarView.leftControls = [btn1]
        

    }
    
    
    func back() {
        self.performSegueWithIdentifier("unwindToMain", sender: self)
    }

}
