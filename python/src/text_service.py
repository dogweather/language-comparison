import re

DOUBLE_QUOTED_TEXT = re.compile(r'"([^"]+)"')       # "Hello"
FRACTION           = re.compile(r'\b(\d+)/(\d+)\b') # 1/2


def add_typography(text: str) -> str:
    """ Return a new string enhanced with typographic characters:
          Single quotes: ’
          Double quotes: “”
    """
    return DOUBLE_QUOTED_TEXT.sub(r'“\1”', text).replace("'", "’")


def add_html_typography(text: str) -> str:
    """ Add nicer typography that HTML can provide:
          Fractions using superscript and subscript.
    """
    return FRACTION.sub(r'<sup>\1</sup>&frasl;<sub>\2</sub>', text)
