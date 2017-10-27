//
//  DetailsNewsViewController.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 27.10.2017.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import UIKit

class DetailsNewsViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var newsID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsRepository.instance.asyncSearch(id: newsID) { (resultNews) in
            if let news = resultNews {
                DispatchQueue.main.async {
                    self.textLabel.text = news.text
                    if let newsImage = news.image {
                        self.photoImageView.image = newsImage
                    } else {
                        self.photoImageView.isHidden = true
                    }
                }
            }
        }
    }
    
    

}
