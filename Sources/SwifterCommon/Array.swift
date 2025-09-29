//
//  Array.swift
//  SwifterCommon
//
//  Created by xxs on 2025/9/29.
//

import Foundation

extension Array: @retroactive RawRepresentable where Element: Codable {

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8) else { return "[]" }
        return result
    }

    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data) else { return nil }
        self = result
    }
}
