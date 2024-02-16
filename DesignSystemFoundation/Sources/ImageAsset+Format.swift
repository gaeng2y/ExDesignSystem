//
//  ImageAsset+Format.swift
//  
//
//  Created by gaeng2 on 2/5/24.
//

import UIKit

// assets 기본 구현
public extension ImageAsset.Format {
    static let image = ImageAsset.Format(fileExtension: "assets") {
        UIImage(named: $0.named, in: $0.bundle, with: nil)!
    }
    
    static let gif = ImageAsset.Format(fileExtension: "gif") {
        UIImage.gifImage(name: $0.named, bundle: $0.bundle)!
    }
}
