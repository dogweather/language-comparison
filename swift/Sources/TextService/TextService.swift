import Foundation

extension String {
    /// Provide a higher-level API for regexes.
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


/// Return a new String enhanced with typographic characters:
///   Single quotes: ’
///   Double quotes: “ ”
func addTypography(text: String) -> String {
    return text
        .gsub(SINGLE_QUOTE,  "’")
        .gsub(DOUBLE_QUOTES, "“$1”")
}


/// Add nicer typography that HTML can provide:
///   Fractions using superscript and subscript.
func addHtmlTypography(text: String) -> String {
    return text.gsub(FRACTION, #"<sup>\1</sup>&frasl;<sub>\2</sub>"#)
}
