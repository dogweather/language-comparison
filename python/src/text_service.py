"""Plaintext and HTML manipulation."""

from lib2to3.pgen2.parse import ParseError
from bs4 import BeautifulSoup
import re

DOUBLE_QUOTED_TEXT = re.compile(r'"([^"]+)"')  # "Hello"
FRACTION = re.compile(r"\b(\d+)/(\d+)\b")  # 1/2


def add_typography(text: str) -> str:
    """Return a new string enhanced with typographic characters:
    Single quotes: ’
    Double quotes: “”
    """
    return DOUBLE_QUOTED_TEXT.sub(r"“\1”", text).replace("'", "’")


def add_html_typography(text: str) -> str:
    """Add nicer typography that HTML can provide:
    Fractions using superscript and subscript.
    """
    return FRACTION.sub(r"<sup>\1</sup>&frasl;<sub>\2</sub>", text)


def add_pinpoint_ids(body_text: str) -> str:
    id_stack = []
    soup = BeautifulSoup(body_text, "html.parser")

    for s in soup.find_all("section"):
        # Get the outline level.
        maybe_level_class = s["class"][0]
        if not (match := re.match(r"^level-(\d)", maybe_level_class)):
            continue

        level = int(match.group(1))

        # Back the stack up if needed.
        if level == 0:
            id_stack = []
        else:
            times = len(id_stack) - level
            for _ in range(times):
                id_stack.pop()

        # Push the heading onto the stack if needed.
        if level + 1 >= len(id_stack):
            # Get the number from the hx text.
            heading = s.h2 or s.h3 or s.h4 or s.h5 or s.h6
            if not (match := re.search(r"[\d\w]+", heading.text)):
                raise Exception(f"Couldn't find number in {heading}")

            number = match.group(0)
            id_stack.append(number)

        # Create and save the pinpoint id.
        s["id"] = "-".join(id_stack)

    return str(soup)
