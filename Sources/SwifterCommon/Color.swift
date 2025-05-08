//
//  Color.swift
//  SwifterCommon
//
//  Created by xxs on 2025/5/8.
//

import SwiftUI

public extension Color {
    init(hex: String, alpha: CGFloat = 1) {
        #if os(macOS)
        self.init(nsColor: NSColor(hex: hex, alpha: alpha))
        #else
        self.init(uiColor: UIColor(hex: hex, alpha: alpha))
        #endif
    }

    // 随机色
    static var random: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }

    // 薄荷绿 (Mint Green)
    static let mintGreen = Color(hex: "#98FF98")

    // 珊瑚红 (Coral)
    static let coral = Color(hex: "#FF7F50")

    // 天空蓝 (Sky Blue)
    static let skyBlue = Color(hex: "#87CEEB")

    // 薰衣草紫 (Lavender)
    static let lavender = Color(hex: "#E6E6FA")

    // 柠檬黄 (Lemon Yellow)
    static let lemonYellow = Color(hex: "#FFF44F")

    // 烟灰色 (Smoke Gray)
    static let smokeGray = Color(hex: "#708090")

    // 珍珠白 (Pearl White)
    static let pearlWhite = Color(hex: "#F8F6F0")

    // 石墨黑 (Graphite)
    static let graphite = Color(hex: "#2F4F4F")

    // 土耳其蓝 (Turquoise)
    static let turquoise = Color(hex: "#40E0D0")

    // 樱花粉 (Sakura Pink)
    static let sakuraPink = Color(hex: "#FFB7C5")

    // 海军蓝 (Navy Blue)
    static let navyBlue = Color(hex: "#000080")

    // 酒红色 (Burgundy)
    static let burgundy = Color(hex: "#800020")

    // 芥末黄 (Mustard Yellow)
    static let mustardYellow = Color(hex: "#FFDB58")

    // 猩红 (Crimson)
    static let crimson = Color(hex: "#DC143C")

    // 砖红 (Brick Red)
    static let brickRed = Color(hex: "#B22222")

    // 深绿 (Forest Green)
    static let forestGreen = Color(hex: "#228B22")

    // 青色 (Cyan)
    static let cyan = Color(hex: "#00FFFF")

    // 宝石蓝 (Sapphire)
    static let sapphire = Color(hex: "#0F52BA")

    // 暗紫 (Dark Violet)
    static let darkViolet = Color(hex: "#9400D3")

    // 褐色 (Chestnut)
    static let chestnut = Color(hex: "#954535")

    // 橄榄绿 (Olive)
    static let olive = Color(hex: "#808000")

    // 奶油色 (Cream)
    static let cream = Color(hex: "#FFFDD0")

    // 象牙白 (Ivory)
    static let ivory = Color(hex: "#FFFFF0")

    // 咖啡色 (Coffee)
    static let coffee = Color(hex: "#6F4E37")

    // 煤灰色 (Charcoal)
    static let charcoal = Color(hex: "#36454F")

    // 酸橙绿 (Lime Green)
    static let limeGreen = Color(hex: "#32CD32")

    // 奶油橙 (Apricot)
    static let apricot = Color(hex: "#FBCEB1")

    // 火山灰 (Ash Gray)
    static let ashGray = Color(hex: "#B2BEB5")

    // 鹅黄色 (Canary Yellow)
    static let canaryYellow = Color(hex: "#FFEF00")

    // 樱桃红 (Cherry Red)
    static let cherryRed = Color(hex: "#DE3163")

    // 青蓝色 (Teal)
    static let teal = Color(hex: "#008080")

    // 宝石绿 (Emerald)
    static let emerald = Color(hex: "#50C878")

    // 锈红色 (Rust)
    static let rust = Color(hex: "#B7410E")

    // 莓果色 (Berry)
    static let berry = Color(hex: "#990F4B")

    // 粉蓝色 (Baby Blue)
    static let babyBlue = Color(hex: "#89CFF0")

    // 木炭黑 (Jet Black)
    static let jetBlack = Color(hex: "#343434")

    // 藕粉色 (Mauve)
    static let mauve = Color(hex: "#E0B0FF")

    // 石板蓝 (Slate Blue)
    static let slateBlue = Color(hex: "#6A5ACD")

    // 沙棕色 (Tan)
    static let tan = Color(hex: "#D2B48C")

    // 芭比粉 (Barbie Pink)
    static let barbiePink = Color(hex: "#DA1884")

    // 番茄红 (Tomato)
    static let tomato = Color(hex: "#FF6347")
}

#if os(macOS)
public extension NSColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
        var string = ""
        let lowercaseHexString = hex.lowercased()
        if lowercaseHexString.hasPrefix("0x") {
            string = lowercaseHexString.replacingOccurrences(of: "0x", with: "")
        } else if hex.hasPrefix("#") {
            string = hex.replacingOccurrences(of: "#", with: "")
        } else {
            string = hex
        }

        if string.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }

        guard let hexValue = Int(string, radix: 16) else {
            self.init(cgColor: CGColor.white)!
            return
        }

        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        let red = CGFloat((hexValue >> 16) & 0xFF) / 255.0
        let green = CGFloat((hexValue >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hexValue & 0xFF) / 255.0
        self.init(
            colorSpace: .sRGB,
            components: [CGFloat(red), CGFloat(green), CGFloat(blue), CGFloat(trans)],
            count: 4
        )
    }

    // 随机色
    static var random: NSColor {
        NSColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }

    // 薄荷绿 (Mint Green)
    static let mintGreen = NSColor(hex: "#98FF98")

    // 珊瑚红 (Coral)
    static let coral = NSColor(hex: "#FF7F50")

    // 天空蓝 (Sky Blue)
    static let skyBlue = NSColor(hex: "#87CEEB")

    // 薰衣草紫 (Lavender)
    static let lavender = NSColor(hex: "#E6E6FA")

    // 柠檬黄 (Lemon Yellow)
    static let lemonYellow = NSColor(hex: "#FFF44F")

    // 烟灰色 (Smoke Gray)
    static let smokeGray = NSColor(hex: "#708090")

    // 珍珠白 (Pearl White)
    static let pearlWhite = NSColor(hex: "#F8F6F0")

    // 石墨黑 (Graphite)
    static let graphite = NSColor(hex: "#2F4F4F")

    // 土耳其蓝 (Turquoise)
    static let turquoise = NSColor(hex: "#40E0D0")

    // 樱花粉 (Sakura Pink)
    static let sakuraPink = NSColor(hex: "#FFB7C5")

    // 海军蓝 (Navy Blue)
    static let navyBlue = NSColor(hex: "#000080")

    // 酒红色 (Burgundy)
    static let burgundy = NSColor(hex: "#800020")

    // 芥末黄 (Mustard Yellow)
    static let mustardYellow = NSColor(hex: "#FFDB58")

    // 猩红 (Crimson)
    static let crimson = NSColor(hex: "#DC143C")

    // 砖红 (Brick Red)
    static let brickRed = NSColor(hex: "#B22222")

    // 深绿 (Forest Green)
    static let forestGreen = NSColor(hex: "#228B22")

    // 青色 (Cyan)
    static let cyan = NSColor(hex: "#00FFFF")

    // 宝石蓝 (Sapphire)
    static let sapphire = NSColor(hex: "#0F52BA")

    // 暗紫 (Dark Violet)
    static let darkViolet = NSColor(hex: "#9400D3")

    // 褐色 (Chestnut)
    static let chestnut = NSColor(hex: "#954535")

    // 橄榄绿 (Olive)
    static let olive = NSColor(hex: "#808000")

    // 奶油色 (Cream)
    static let cream = NSColor(hex: "#FFFDD0")

    // 象牙白 (Ivory)
    static let ivory = NSColor(hex: "#FFFFF0")

    // 咖啡色 (Coffee)
    static let coffee = NSColor(hex: "#6F4E37")

    // 煤灰色 (Charcoal)
    static let charcoal = NSColor(hex: "#36454F")

    // 酸橙绿 (Lime Green)
    static let limeGreen = NSColor(hex: "#32CD32")

    // 奶油橙 (Apricot)
    static let apricot = NSColor(hex: "#FBCEB1")

    // 火山灰 (Ash Gray)
    static let ashGray = NSColor(hex: "#B2BEB5")

    // 鹅黄色 (Canary Yellow)
    static let canaryYellow = NSColor(hex: "#FFEF00")

    // 樱桃红 (Cherry Red)
    static let cherryRed = NSColor(hex: "#DE3163")

    // 青蓝色 (Teal)
    static let teal = NSColor(hex: "#008080")

    // 宝石绿 (Emerald)
    static let emerald = NSColor(hex: "#50C878")

    // 锈红色 (Rust)
    static let rust = NSColor(hex: "#B7410E")

    // 莓果色 (Berry)
    static let berry = NSColor(hex: "#990F4B")

    // 粉蓝色 (Baby Blue)
    static let babyBlue = NSColor(hex: "#89CFF0")

    // 木炭黑 (Jet Black)
    static let jetBlack = NSColor(hex: "#343434")

    // 藕粉色 (Mauve)
    static let mauve = NSColor(hex: "#E0B0FF")

    // 石板蓝 (Slate Blue)
    static let slateBlue = NSColor(hex: "#6A5ACD")

    // 沙棕色 (Tan)
    static let tan = NSColor(hex: "#D2B48C")

    // 芭比粉 (Barbie Pink)
    static let barbiePink = NSColor(hex: "#DA1884")

    // 番茄红 (Tomato)
    static let tomato = NSColor(hex: "#FF6347")
}

#else
public extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
       var string = ""
       let lowercaseHexString = hex.lowercased()
       if lowercaseHexString.hasPrefix("0x") {
           string = lowercaseHexString.replacingOccurrences(of: "0x", with: "")
       } else if hex.hasPrefix("#") {
           string = hex.replacingOccurrences(of: "#", with: "")
       } else {
           string = hex
       }

       if string.count == 3 { // convert hex to 6 digit format if in short format
           var str = ""
           string.forEach { str.append(String(repeating: String($0), count: 2)) }
           string = str
       }

       guard let hexValue = Int(string, radix: 16) else {
           self.init(cgColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1))
           return
       }

       var trans = alpha
       if trans < 0 { trans = 0 }
       if trans > 1 { trans = 1 }

       let red = CGFloat((hexValue >> 16) & 0xFF) / 255.0
       let green = CGFloat((hexValue >> 8) & 0xFF) / 255.0
       let blue = CGFloat(hexValue & 0xFF) / 255.0
       self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(trans))
   }

    // 随机色
    static var random: UIColor {
        UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }

    // 薄荷绿 (Mint Green)
    static let mintGreen = UIColor(hex: "#98FF98")

    // 珊瑚红 (Coral)
    static let coral = UIColor(hex: "#FF7F50")

    // 天空蓝 (Sky Blue)
    static let skyBlue = UIColor(hex: "#87CEEB")

    // 薰衣草紫 (Lavender)
    static let lavender = UIColor(hex: "#E6E6FA")

    // 柠檬黄 (Lemon Yellow)
    static let lemonYellow = UIColor(hex: "#FFF44F")

    // 烟灰色 (Smoke Gray)
    static let smokeGray = UIColor(hex: "#708090")

    // 珍珠白 (Pearl White)
    static let pearlWhite = UIColor(hex: "#F8F6F0")

    // 石墨黑 (Graphite)
    static let graphite = UIColor(hex: "#2F4F4F")

    // 土耳其蓝 (Turquoise)
    static let turquoise = UIColor(hex: "#40E0D0")

    // 樱花粉 (Sakura Pink)
    static let sakuraPink = UIColor(hex: "#FFB7C5")

    // 海军蓝 (Navy Blue)
    static let navyBlue = UIColor(hex: "#000080")

    // 酒红色 (Burgundy)
    static let burgundy = UIColor(hex: "#800020")

    // 芥末黄 (Mustard Yellow)
    static let mustardYellow = UIColor(hex: "#FFDB58")

    // 猩红 (Crimson)
    static let crimson = UIColor(hex: "#DC143C")

    // 砖红 (Brick Red)
    static let brickRed = UIColor(hex: "#B22222")

    // 深绿 (Forest Green)
    static let forestGreen = UIColor(hex: "#228B22")

    // 青色 (Cyan)
    static let cyan = UIColor(hex: "#00FFFF")

    // 宝石蓝 (Sapphire)
    static let sapphire = UIColor(hex: "#0F52BA")

    // 暗紫 (Dark Violet)
    static let darkViolet = UIColor(hex: "#9400D3")

    // 褐色 (Chestnut)
    static let chestnut = UIColor(hex: "#954535")

    // 橄榄绿 (Olive)
    static let olive = UIColor(hex: "#808000")

    // 奶油色 (Cream)
    static let cream = UIColor(hex: "#FFFDD0")

    // 象牙白 (Ivory)
    static let ivory = UIColor(hex: "#FFFFF0")

    // 咖啡色 (Coffee)
    static let coffee = UIColor(hex: "#6F4E37")

    // 煤灰色 (Charcoal)
    static let charcoal = UIColor(hex: "#36454F")

    // 酸橙绿 (Lime Green)
    static let limeGreen = UIColor(hex: "#32CD32")

    // 奶油橙 (Apricot)
    static let apricot = UIColor(hex: "#FBCEB1")

    // 火山灰 (Ash Gray)
    static let ashGray = UIColor(hex: "#B2BEB5")

    // 鹅黄色 (Canary Yellow)
    static let canaryYellow = UIColor(hex: "#FFEF00")

    // 樱桃红 (Cherry Red)
    static let cherryRed = UIColor(hex: "#DE3163")

    // 青蓝色 (Teal)
    static let teal = UIColor(hex: "#008080")

    // 宝石绿 (Emerald)
    static let emerald = UIColor(hex: "#50C878")

    // 锈红色 (Rust)
    static let rust = UIColor(hex: "#B7410E")

    // 莓果色 (Berry)
    static let berry = UIColor(hex: "#990F4B")

    // 粉蓝色 (Baby Blue)
    static let babyBlue = UIColor(hex: "#89CFF0")

    // 木炭黑 (Jet Black)
    static let jetBlack = UIColor(hex: "#343434")

    // 藕粉色 (Mauve)
    static let mauve = UIColor(hex: "#E0B0FF")

    // 石板蓝 (Slate Blue)
    static let slateBlue = UIColor(hex: "#6A5ACD")

    // 沙棕色 (Tan)
    static let tan = UIColor(hex: "#D2B48C")

    // 芭比粉 (Barbie Pink)
    static let barbiePink = UIColor(hex: "#DA1884")

    // 番茄红 (Tomato)
    static let tomato = UIColor(hex: "#FF6347")
}
#endif
