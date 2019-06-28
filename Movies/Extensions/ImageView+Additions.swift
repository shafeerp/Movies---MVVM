//
//  ImageView+Additions.swift
//  MVVM
//
//  Created by Shafeer Puthalan on 28/06/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//


import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func load(url : String) {
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: URL(string: url)!){
                let imageToCache = UIImage(data: data)
                imageCache.setObject(imageToCache as AnyObject, forKey: url as AnyObject)
                self.image = imageToCache
            }
        }
    }
    
    func getImageFromServer(url : String) {
        if let cachedImage = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, error) in
            if error != nil {
                return
            }
            let imageToCache = UIImage(data: data!)
            imageCache.setObject(imageCache, forKey: url as AnyObject)
            DispatchQueue.main.async {
                self.image = imageToCache
            }
            
            
        }.resume()
    }
    
}
