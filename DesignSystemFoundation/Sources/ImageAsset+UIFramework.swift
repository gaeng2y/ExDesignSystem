//
//  ImageAsset+UIFramework.swift
//  
//
//  Created by gaeng2 on 2/5/24.
//

import Foundation
import SwiftUI
import UIKit

public extension ImageAsset {
    func toUIImage() -> UIImage {
        UIImage(named: self.named, in: self.bundle, with: nil)!
    }
    
    func toImage() -> Image {
        Image(self.named, bundle: self.bundle)
    }
}

// MARK: - UIKit
public extension UIImage {
    convenience init?(_ asset: ImageAsset) {
        self.init(named: asset.named, in: asset.bundle, compatibleWith: nil)
    }
}

// MARK: - SwiftUI
public extension Image {
    init(_ asset: ImageAsset) {
        self.init(asset.named, bundle: asset.bundle)
    }
}
