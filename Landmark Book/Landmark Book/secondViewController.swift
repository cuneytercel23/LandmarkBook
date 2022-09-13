//
//  secondViewController.swift
//  Landmark Book
//
//  Created by Cüneyt Erçel on 29.07.2022.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var imagesLabel: UILabel!
    @IBOutlet weak var imagesView: UIImageView!
     var selectedlandmarkNames = ""
    var selectedlandmarkImages = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesLabel.text = selectedlandmarkNames
        imagesView.image = selectedlandmarkImages
        // Do any additional setup after loading the view.
    }
    


}
