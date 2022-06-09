from text_service import add_html_typography, add_pinpoint_ids, add_typography


WITHOUT_IDS = """<section class="level-0 non-meta outline"><h2>1.</h2>No person shall be criminally responsible under this Statute for conduct prior to the entry into force of the Statute.</section>
<section class="level-0 non-meta outline"><h2>2.</h2>In the event of a change in the law applicable to a given case prior to a final judgement, the law more favourable to the person being investigated, prosecuted or convicted shall apply.</section>
<section class="level-1 non-meta outline"><h3>(a)</h3>Res ipsa loquitur</section>
<section class="level-2 non-meta outline"><h4>(i)</h4>Res ipsa loquitur</section>
<section class="level-2 non-meta outline"><h4>(ii)</h4>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(b)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(c)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(d)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(e)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(f)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(g)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(h)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(i)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(j)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline"><h3>(k)</h3>Res ipsa loquitur</section>
"""

WITH_IDS = """<section class="level-0 non-meta outline" id="1"><h2>1.</h2>No person shall be criminally responsible under this Statute for conduct prior to the entry into force of the Statute.</section>
<section class="level-0 non-meta outline" id="2"><h2>2.</h2>In the event of a change in the law applicable to a given case prior to a final judgement, the law more favourable to the person being investigated, prosecuted or convicted shall apply.</section>
<section class="level-1 non-meta outline" id="2-a"><h3>(a)</h3>Res ipsa loquitur</section>
<section class="level-2 non-meta outline" id="2-a-i"><h4>(i)</h4>Res ipsa loquitur</section>
<section class="level-2 non-meta outline" id="2-a-ii"><h4>(ii)</h4>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-b"><h3>(b)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-c"><h3>(c)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-d"><h3>(d)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-e"><h3>(e)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-f"><h3>(f)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-g"><h3>(g)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-h"><h3>(h)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-i"><h3>(i)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-j"><h3>(j)</h3>Res ipsa loquitur</section>
<section class="level-1 non-meta outline" id="2-k"><h3>(k)</h3>Res ipsa loquitur</section>
"""


class TestAddPinpointIds:
    def test_typical_case(_self):
        assert add_pinpoint_ids(WITHOUT_IDS) == WITH_IDS


class TestAddTypography:
    def test_converts_a_single_quote(_self):
        assert add_typography("dog's life") == "dog’s life"

    def test_converts_double_quotes(_self):
        assert add_typography('"Hey!"') == "“Hey!”"


class TestAddHtmlTypography:
    def test_creates_simple_fractions(_self):
        plaintext = "on 1/2 of an egg"
        expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

        assert add_html_typography(plaintext) == expected
