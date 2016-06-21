//
//  ViewController.swift
//  TargetAction-Swift-IB
//
//  Created by Alistair Cooper on 4/19/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import UIKit

enum ImageLoadError: ErrorType {
    case ImagesUnavailable
}


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
            
        setupImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupImageView()
    {
        if let imageArray = ImageModel.imageArray {
            
            imageView.animationImages = imageArray
            
            imageView.animationDuration = 1.3
            imageView.startAnimating()
            
        } else {
            ImageLoadError.ImagesUnavailable
        }
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    @IBAction func enterButton(sender: UIButton, forEvent event: UIEvent) {
        mainTitle.text = textField.text?.uppercaseString
    }

}

