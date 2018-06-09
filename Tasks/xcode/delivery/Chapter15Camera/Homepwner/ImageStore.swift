//
//  ImageStore.swift
//  Homepwdner
//
//  Created by Margaro on 08/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class ImageStore {

    let cache = NSCache<AnyObject, UIImage>()

    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }

}
