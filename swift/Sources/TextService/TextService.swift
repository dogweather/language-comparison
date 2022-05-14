import Foundation

// Provide a higher-level API for regexes.
extension String {
    func gsub(_ regex: NSRegularExpression, _ replacement: String) -> String {
        return regex.stringByReplacingMatches(
            in: self,
            range: NSRange(location: 0, length: self.utf16.count),
            withTemplate: replacement
        )
    }
}


let SINGLE_QUOTE =  try! NSRegularExpression(pattern: "'")
let DOUBLE_QUOTES = try! NSRegularExpression(pattern: #""([^"]+)""#)
let FRACTION =      try! NSRegularExpression(pattern: #"\b(\d+)/(\d+)\b"#)


func addTypography(text: String) -> String {
    return text
        .gsub(SINGLE_QUOTE,  "’")
        .gsub(DOUBLE_QUOTES, "“$1”")
}


func addHtmlTypography(text: String) -> String {
    return text.gsub(FRACTION, #"<sup>\1</sup>&frasl;<sub>\2</sub>"#)
}
