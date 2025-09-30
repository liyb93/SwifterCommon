//
//  String+SwifterCommon.swift
//  SwifterCommon
//
//  Created by xxs on 2025/9/30.
//

import Foundation
import CommonCrypto
import CryptoKit

// MARK: - 加密
public extension String {
    var md5: String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }

    var sha256: String {
        let inputData = Data(self.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.map { String(format: "%02x", $0) }.joined()
    }
}

// MARK: - 字符串处理
public extension String {
    @inlinable
    var length: Int {
        (self as NSString).length
    }

    @inlinable
    func substring(with range: NSRange) -> String {
        (self as NSString).substring(with: range)
    }

    // 根据分隔符分割字符串
    func split(by separators: [String]) throws -> [String] {
        let pattern = separators
            .map { NSRegularExpression.escapedPattern(for: $0) }
            .joined(separator: "|")

        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let replaced = regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: utf16.count), withTemplate: "\u{1F}")

        return replaced.components(separatedBy: "\u{1F}")
            .filter { !$0.isEmpty }
    }
}

// MARK: - Date
public extension String {
    // 默认24小时制
    func date(_ format: String, locale: Locale = Locale(identifier: "en_BG")) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale =  locale
        return dateFormatter.date(from: self)
    }
}
