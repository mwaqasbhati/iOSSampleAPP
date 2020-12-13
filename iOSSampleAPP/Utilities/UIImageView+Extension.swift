//
//  UIImageView+Extension.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import UIKit
import ImageCache

extension UIImageView {
    
    func downloadImage(from url: URL, placeholder: String, completion: ((UIImage) -> Void)? = nil) {
        
        image = UIImage(named: placeholder)
        ImageCache.publicCache.load(url: url as NSURL) { [weak self] (image) in
            if let img = image {
                if let block = completion {
                    block(img)
                } else {
                    self?.image = img
                }
            }
        }
    }
    
}



