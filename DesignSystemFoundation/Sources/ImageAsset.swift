//
//  ImageAsset.swift
//  
//
//  Created by gaeng2 on 2/5/24.
//

import Foundation

public struct ImageAsset {
    public struct Format {
        let fileExtension: String
        let convert: (ImageAsset) -> NSObjectProtocol
    }
    
    var named: String
    var bundle: Bundle
    var format: Format
    
    public init(named: String, bundle: Bundle, format: Format) {
        self.named = named
        self.bundle = bundle
        self.format = format
    }
}
