//
//  Link.swift
//  SwifterCommon
//
//  Created by xxs on 2025/5/8.
//

import Foundation
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

public protocol Linkable {
    var url: URL? { get }
}

// MARK: - Link
@MainActor public func openURL(_ link: Linkable) {
    openURL(link.url)
}

@MainActor public func openURL(_ url: URL?) {
    guard let url = url else { return }
    #if os(macOS)
    NSWorkspace.shared.open(url)
    #else
    UIApplication.shared.open(url)
    #endif
}
