//
//  View+Toast.swift
//  SwifterCommon
//
//  Created by xxs on 2025/10/16.
//

import SwiftUI
import PopupView

struct ToastConfig {
    var padding: EdgeInsets = EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
    var backgroundColor: Color = .black
    var textColor: Color = .white
    var font: Font = .system(size: 16)
    var cornerRadius: CGFloat = 8

    var dragToDismiss: Bool = true
    var dragToDismissDistance: CGFloat?
    var closeOnTap: Bool = true
    var closeOnTapOutside: Bool = false
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

extension View {
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
        } customize: {
            if let dragToDismissDistance = config.dragToDismissDistance {
                $0
                .type(.floater())
                .closeOnTap(config.closeOnTap)
                .dragToDismiss(config.dragToDismiss)
                .dragToDismissDistance(dragToDismissDistance)
                .closeOnTapOutside(config.closeOnTapOutside)
                .position(position.popupPosition())
                .autohideIn(delay > 0 ? delay : nil)
            } else {
                $0
                .type(.floater())
                .closeOnTap(config.closeOnTap)
                .dragToDismiss(config.dragToDismiss)
                .closeOnTapOutside(config.closeOnTapOutside)
                .position(position.popupPosition())
                .autohideIn(delay > 0 ? delay : nil)
            }
        }
    }
}
