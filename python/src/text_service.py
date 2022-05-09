import re

DOUBLE_QUOTED = re.compile(r'"([^"]+)"')


def add_typography(text: str) -> str:
    """Return a new string enhanced with typographic characters:
         Single quotes: ’
          Double quotes: “”
    """
    return DOUBLE_QUOTED.sub(r'“\1”', text).replace("'", "’")


def add_html_typography(text: str) -> str:
    ...
