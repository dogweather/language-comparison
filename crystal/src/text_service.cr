# Plaintext and HTML manipulation.
module TextService
  extend self

  #
  # Return a new string enhanced with typographic characters:
  #  Single quotes: ’
  #  Double quotes: “”
  #
  def add_typography(text : String) : String
    text.gsub(/"([^"]+)"/, "“\\1”")
        .gsub("'", "’")
  end


  #
  # Add nicer typography that HTML can provide:
  #  Fractions using superscript and subscript.
  #
  def add_html_typography(text : String) : String
    text.gsub(%r{\b(\d+)/(\d+)\b}, "<sup>\\1</sup>&frasl;<sub>\\2</sub>")
  end
end
