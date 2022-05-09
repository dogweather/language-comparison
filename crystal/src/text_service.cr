# Plaintext and HTML manipulation.
module TextService
  #
  # Return a new string enhanced with typographic characters:
  #  Single quotes: ’
  #  Double quotes: “”
  #
  def self.add_typography(text : String) : String
    text.gsub(/"([^"]+)"/, "“\\1”")
        .gsub("'", "’")
  end


  #
  # Add nicer typography that HTML can provide:
  #  Fractions using superscript and subscript.
  #
  def self.add_html_typography(text : String) : String
    text.gsub(%r{\b(\d+)/(\d+)\b}, "<sup>\\1</sup>&frasl;<sub>\\2</sub>")
  end
end
