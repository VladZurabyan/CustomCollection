//
//  ViewController.swift
//  CustomCollectionLayout
//
//  Created by ADMIN on 24/12/2019.
//  Copyright © 2019 MaksymHusar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var model: Fruit!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = model!.icon
        label.text = model!.text
        label.numberOfLines = 0
    }
}
