#![allow(dead_code)]

/// Plaintext and HTML manipulation.
use lazy_static::lazy_static;
use regex::Regex;
use std::borrow::Cow;

lazy_static! {
    static ref DOUBLE_QUOTED_TEXT: Regex = Regex::new(r#""(?P<content>[^"]+)""#).unwrap();
    static ref SINGLE_QUOTE: Regex = Regex::new(r"'").unwrap();
    static ref FRACTION: Regex = Regex::new(r"\b(\d+)/(\d+)\b").unwrap();
    static ref PINPOINT_CITE: Regex =
        Regex::new(r#"">article (\d+)</a>, paragraph (\d+)"#).unwrap();
}

/// Return a new string enhanced with typographic characters:
///     Single quotes: ’
///     Double quotes: “”
fn add_typography(text: &str) -> String {
    let with_single_quotes = add_single_quotes(text);
    add_double_quotes(&with_single_quotes).into_owned()
}

/// Return a new string enhanced with typographic characters:
///     Double quotes: “”
fn add_double_quotes(text: &str) -> Cow<str> {
    DOUBLE_QUOTED_TEXT.replace_all(text, "“$content”")
}

/// Return a new string enhanced with typographic characters:
///     Single quotes: ’
///     Double quotes: “”
fn add_single_quotes(text: &str) -> Cow<str> {
    SINGLE_QUOTE.replace_all(text, "’")
}

/// Add nicer typography that HTML can provide:
///     Fractions using superscript and subscript.
///
fn add_html_typography(text: &str) -> Cow<str> {
    FRACTION.replace_all(text, r"<sup>$1</sup>&frasl;<sub>$2</sub>")
}

/// Add pinpoint citation cross-reference links.
///
fn add_pinpoint(text: &str) -> Cow<str> {
    PINPOINT_CITE.replace_all(text, r#"#$2">article $1, paragraph $2</a>"#)
}

//
//
// Tests
//
//

#[cfg(test)]
mod tests {
    use crate::{add_html_typography, add_pinpoint, add_typography};

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

    //
    // .add_pinpoint()
    //

    #[test]
    fn adds_simple_xref() {
        const without: &str = r##"<section class="level-0 non-meta outline" id="2"><h2><a title="Permanent link" href="#2">2.</a></h2>If a State becomes a Party to this Statute after its entry into force, the Court may exercise its jurisdiction only with respect to crimes committed after the entry into force of this Statute for that State, unless that State has made a declaration under <a data-toggle="tooltip" title="Preconditions to the exercise of jurisdiction" href="article_12_preconditions_to_the_exercise_of_jurisdiction">article 12</a>, paragraph 3.</section>"##;
        const with___: &str = r##"<section class="level-0 non-meta outline" id="2"><h2><a title="Permanent link" href="#2">2.</a></h2>If a State becomes a Party to this Statute after its entry into force, the Court may exercise its jurisdiction only with respect to crimes committed after the entry into force of this Statute for that State, unless that State has made a declaration under <a data-toggle="tooltip" title="Preconditions to the exercise of jurisdiction" href="article_12_preconditions_to_the_exercise_of_jurisdiction#3">article 12, paragraph 3</a>.</section>"##;

        assert_eq!(add_pinpoint(""), "");
        assert_eq!(add_pinpoint(without), with___);
        assert_eq!(
            add_pinpoint(concat!(without, without)),
            with___.to_owned() + with___
        );
    }
}
