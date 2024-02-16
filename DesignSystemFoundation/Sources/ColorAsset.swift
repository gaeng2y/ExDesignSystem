//
//  ColorAsset.swift
//  DesignSystemFoundation
//
//  Created by gaeng2 on 1/26/24.
//

import UIKit

public struct ColorAsset {
    enum ColorType {
        case literal
        case asset(named: String, bundler: Bundle?)
    }
    
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    var colorType: ColorType
    
    public init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        self.colorType = .literal
        self.red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        self.green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        self.blue = Double(rgbValue & 0x0000FF) / 255.0
        self.alpha = 1
    }
    
    public init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.colorType = .literal
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public init(named: String, bundle: Bundle?) {
        if let bundle = bundle,
           let color = UIColor(named: named, in: bundle, compatibleWith: nil) {
            self.colorType = .asset(named: named, bundler: bundle)
            var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
            color.getRed(&r, green: &g, blue: &b, alpha: &a)
            self.red = Double(r)
            self.green = Double(g)
            self.blue = Double(b)
            self.alpha = Double(a)
        } else {
            self.colorType = .literal
            self.red = 0
            self.green = 0
            self.blue = 0
            self.alpha = 0
        }
    }
}
