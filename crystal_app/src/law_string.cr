module LawString
  VERSION = "0.1.0"

  # Convert " " to “ ” and ' to ’.
  def self.double_quotes(text : String) : String
    text.gsub(/"([^"]+)"/, "“\\1”")
        .gsub("'", "’")
  end
end
