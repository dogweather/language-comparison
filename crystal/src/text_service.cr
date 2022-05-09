module TextService
  VERSION = "0.1.0"

  def self.add_typography(text : String) : String
    text.gsub(/"([^"]+)"/, "“\\1”")
        .gsub("'", "’")
  end

  def self.add_html_typography(text : String) : String
    text.gsub(%r{\b(\d+)/(\d+)\b}, "<sup>\\1</sup>&frasl;<sub>\\2</sub>")
  end
end
