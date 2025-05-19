//
//  Space.swift
//  SwifterCommon
//
//  Created by xxs on 2025/5/8.
//

import Foundation

// MARK: - 间距
extension CGFloat: SpacingValueConvertible {
    public static func from(_ value: CGFloat) -> CGFloat { value }
    public static var spacing: Spacing<CGFloat>.Type { Spacing<CGFloat>.self }
}

extension Double: SpacingValueConvertible {
    public static func from(_ value: CGFloat) -> Double { Double(value) }
    public static var spacing: Spacing<Double>.Type { Spacing<Double>.self }
}

extension Float: SpacingValueConvertible {
    public static func from(_ value: CGFloat) -> Float { Float(value) }
    public static var spacing: Spacing<Float>.Type { Spacing<Float>.self }
}

extension Int: SpacingValueConvertible {
    public static func from(_ value: CGFloat) -> Int { Int(value) }
    public static var spacing: Spacing<Int>.Type { Spacing<Int>.self }
}

extension UInt: SpacingValueConvertible {
    public static func from(_ value: CGFloat) -> UInt { UInt(value) }
    public static var spacing: Spacing<UInt>.Type { Spacing<UInt>.self }
}

public protocol SpacingValueConvertible {
    static func from(_ value: CGFloat) -> Self
}

public struct Spacing<T: SpacingValueConvertible> {
    /// zero    0
    public static var zero: T { T.from(0) }
    /// extraSmall 4
    public static var extraSmall: T { T.from(4) }
    /// twoExtraSmall 6
    public static var twoExtraSmall: T { T.from(6) }
    /// small   8
    public static var small: T { T.from(8) }
    /// threeExtraSmall 10
    public static var threeExtraSmall: T { T.from(10) }
    /// fourExtraSmall 12
    public static var fourExtraSmall: T { T.from(12) }
    /// extraMedium  14
    public static var extraMedium: T { T.from(14) }
    /// medium  16
    public static var medium: T { T.from(16) }
    /// twoMedium   18
    public static var twoMedium: T { T.from(18) }
    /// threeMedium   20
    public static var threeMedium: T { T.from(20) }
    /// fourMedium   22
    public static var fourMedium: T { T.from(22) }
    /// large   24
    public static var large: T { T.from(24) }
    /// extraLarge 32
    public static var extraLarge: T { T.from(32) }
    /// twoExtraLarge 40
    public static var twoExtraLarge: T { T.from(40) }
    /// threeExtraLarge 48
    public static var threeExtraLarge: T { T.from(48) }
}

