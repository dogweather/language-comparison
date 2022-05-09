#![allow(dead_code)]

/// Plaintext and HTML manipulation.

use lazy_static::lazy_static;
use regex::Regex;
use std::borrow::Cow;

lazy_static! {
    static ref DOUBLE_QUOTED_TEXT: Regex = Regex::new(r#""(?P<content>[^"]+)""#).unwrap();
    static ref FRACTION:           Regex = Regex::new(r"\b(\d+)/(\d+)\b").unwrap();
}

/// Return a new string enhanced with typographic characters:
///     Single quotes: ’
///     Double quotes: “”
fn add_typography(text: &str) -> String {
    DOUBLE_QUOTED_TEXT
        .replace_all(text, "“$content”")
        .replace("'", "’")
}

/// Add nicer typography that HTML can provide:
///     Fractions using superscript and subscript.
///
fn add_html_typography(text: &str) -> Cow<str> {
    FRACTION.replace_all(text, r"<sup>$1</sup>&frasl;<sub>$2</sub>")
}

#[cfg(test)]
mod tests {
    use crate::{add_html_typography, add_typography};

    //
    // .add_typography()
    //

    #[test]
    fn converts_to_double_quotes() {
        assert_eq!(add_typography(r#""Hello""#), "“Hello”");
    }

    #[test]
    fn converts_a_single_quote() {
        assert_eq!(add_typography("Today's Menu"), "Today’s Menu");
    }

    //
    // .add_html_typography()
    //

    #[test]
    fn creates_simple_fractions() {
        let plaintext = "on 1/2 of an egg";
        let expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg";

        assert_eq!(add_html_typography(plaintext), expected);
    }
}
