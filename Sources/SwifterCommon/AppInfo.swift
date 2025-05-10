// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// MARK: - App 信息
private enum AppInfoKey: String {
    case version = "CFBundleShortVersionString"
    case identifier = "CFBundleIdentifier"
    case name = "CFBundleDisplayName"
    case build = "CFBundleVersion"
}

public struct AppInfo {
    private static subscript(key: AppInfoKey) -> String {
        Bundle.main.infoDictionary?[key.rawValue] as? String ?? "none"
    }
    public static let name = Self[.name]
    public static let version = Self[.version]
    public static let identifier = Self[.identifier]
    public static let build = Self[.build]
    
    public static func associationKey(_ key: String) -> String {
        identifier + ".AssociationKey." + key
    }
}
