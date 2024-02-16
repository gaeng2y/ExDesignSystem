//
//  ColorAsset+UIFramework.swift
//  DesignSystemFoundation
//
//  Created by gaeng2 on 1/26/24.
//

import UIKit
import SwiftUI

public extension ColorAsset {
    func toUIColor() -> UIColor {
        UIColor(red: self.red, green: self.green, blue: self.blue, alpha: self.alpha)
    }
    
    func toColor() -> Color {
        Color(red: self.red, green: self.green, blue: self.blue, opacity: self.alpha)
    }
}

// MARK: - UIKit Method (background를 넣어햐나..?)
public extension UIView {
    func setBackgroundColor(_ colorAsset: ColorAsset) {
        self.backgroundColor = colorAsset.toUIColor()
    }
}

public extension UILabel {
    func setTextColor(_ colorAsset: ColorAsset) {
        self.textColor = colorAsset.toUIColor()
    }
}

public extension UIButton {
    func setTitleColor(_ colorAsset: ColorAsset, for state: UIControl.State) {
        self.setTitleColor(colorAsset.toUIColor(), for: state)
    }
}

// MARK: - SwiftUI Modifier
public struct ColorAssetModifier: ViewModifier {
    let colorAsset: ColorAsset

    public func body(content: Content) -> some View {
        content.foregroundColor(colorAsset.toColor())
    }
}

public extension View {
    func colorAsset(_ colorAsset: ColorAsset) -> some View {
        self.modifier(ColorAssetModifier(colorAsset: colorAsset))
    }
}
