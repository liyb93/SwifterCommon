//
//  View+SwifterCommon.swift
//  SwifterCommon
//
//  Created by xxs on 2025/9/30.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool,
                             transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
