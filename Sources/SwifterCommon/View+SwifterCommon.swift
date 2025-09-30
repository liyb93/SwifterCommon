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

    @ViewBuilder
    func `if`<IncludeContent: View, ExcludeContent: View>(
        _ condition: Bool,
        then includeTransform: (Self) -> IncludeContent,
        else excludeTransform: (Self) -> ExcludeContent
    ) -> some View {
        if condition {
            includeTransform(self)
        } else {
            excludeTransform(self)
        }
    }
}
