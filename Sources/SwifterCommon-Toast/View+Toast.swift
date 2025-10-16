//
//  View+Toast.swift
//  SwifterCommon
//
//  Created by xxs on 2025/10/16.
//

import SwiftUI
import PopupView

public struct ToastConfig {
    public var textColor: Color = .white
    public var font: Font = .system(size: 16)
    public var backgroundColor: Color = .black
    public var cornerRadius: CGFloat = 8
    public var padding: EdgeInsets = EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

    public var dragToDismiss: Bool = true
    public var dragToDismissDistance: CGFloat?
    public var closeOnTap: Bool = true
    public var closeOnTapOutside: Bool = false

    public var willDismissCallback: (()->Void)?
    public var dismissCallback: (()->Void)?

    public init(textColor: Color = .white,
                font: Font = .system(size: 16),
                backgroundColor: Color = .black,
                cornerRadius: CGFloat = 8,
                padding: EdgeInsets = EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8),
                dragToDismiss: Bool = true,
                dragToDismissDistance: CGFloat? = nil,
                closeOnTap: Bool = true,
                closeOnTapOutside: Bool = false,
                willDismissCallback: (()->Void)? = nil,
                dismissCallback: (()->Void)? = nil) {
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.dragToDismiss = dragToDismiss
        self.dragToDismissDistance = dragToDismissDistance
        self.closeOnTap = closeOnTap
        self.closeOnTapOutside = closeOnTapOutside
        self.willDismissCallback = willDismissCallback
        self.dismissCallback = dismissCallback
    }
}

public enum ToastPosition {
    case topLeading
    case top
    case topTrailing

    case leading
    case center // usual popup
    case trailing

    case bottomLeading
    case bottom
    case bottomTrailing

    var isTop: Bool {
        [.topLeading, .top, .topTrailing].contains(self)
    }

    var isVerticalCenter: Bool {
        [.leading, .center, .trailing].contains(self)
    }

    var isBottom: Bool {
        [.bottomLeading, .bottom, .bottomTrailing].contains(self)
    }

    var isLeading: Bool {
        [.topLeading, .leading, .bottomLeading].contains(self)
    }

    var isHorizontalCenter: Bool {
        [.top, .center, .bottom].contains(self)
    }

    var isTrailing: Bool {
        [.topTrailing, .trailing, .bottomTrailing].contains(self)
    }

    fileprivate func popupPosition<PopupContent>() -> Popup<PopupContent>.Position where PopupContent: View {
        switch self {
        case .topLeading: return .topLeading
        case .top: return .top
        case .topTrailing: return .topTrailing
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        case .bottomLeading: return .bottomLeading
        case .bottom: return .bottom
        case .bottomTrailing: return .bottomTrailing
        }
    }
}

public extension View {
    func toast(_ text: Binding<String?>, position: ToastPosition = .top, delay: Double = 1, config: ToastConfig = .init()) -> some View {
        popup(item: text) { toast in
            Text(toast)
                .foregroundStyle(.white)
                .font(.system(size: 16))
                .padding(.leading, config.padding.leading)
                .padding(.trailing, config.padding.trailing)
                .padding(.top, config.padding.top)
                .padding(.bottom, config.padding.bottom)
                .background(Color.black)
                .clipShape(.capsule)
        } customize: { result in
            var paramters = result
                .type(.floater())
                .closeOnTap(config.closeOnTap)
                .dragToDismiss(config.dragToDismiss)
                .closeOnTapOutside(config.closeOnTapOutside)
                .position(position.popupPosition())
                .autohideIn(delay > 0 ? delay : nil)
            if let dragToDismissDistance = config.dragToDismissDistance {
                paramters = paramters.dragToDismissDistance(dragToDismissDistance)
            }
            if let willDismissCallback = config.willDismissCallback {
                paramters = paramters.willDismissCallback(willDismissCallback)
            }
            if let dismissCallback = config.dismissCallback {
                paramters = paramters.dismissCallback(dismissCallback)
            }
            return paramters
        }
    }
}
