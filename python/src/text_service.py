import re

DOUBLE_QUOTED = re.compile(r'"([^"]+)"')
FRACTION      = re.compile(r'\b(\d+)/(\d+)\b')


def add_typography(text: str) -> str:
    """ Return a new string enhanced with typographic characters:
          Single quotes: ’
          Double quotes: “”
    """
    return DOUBLE_QUOTED.sub(r'“\1”', text).replace("'", "’")


def add_html_typography(text: str) -> str:
    """ Add nicer typography that HTML can provide:
          Fractions using superscript and subscript.
    """
    return FRACTION.sub(r'<sup>\1</sup>&frasl;<sub>\2</sub>', text)
