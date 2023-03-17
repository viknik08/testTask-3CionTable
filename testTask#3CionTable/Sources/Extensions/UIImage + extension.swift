//
//  UIImage + extension.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 22.02.2023.
//

import UIKit

extension UIImage {
    
    func blur(_ radius: Double) -> UIImage? {
        if let img = CIImage(image: self) {
            return UIImage(ciImage: img.applyingGaussianBlur(sigma: radius))
        }
        return nil
    }
}
