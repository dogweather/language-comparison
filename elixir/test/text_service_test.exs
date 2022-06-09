import TextService, only: [add_typography: 1, add_html_typography: 1, add_pinpoint_ids: 1]

defmodule TextServiceTest do
  @moduledoc """
  Testing the TextService module.
  """

  use ExUnit.Case
  doctest TextService

  @without_ids ~s"""
  <section class="level-0 non-meta outline"><h2>1.</h2>No person shall be criminally responsible under this Statute for conduct prior to the entry into force of the Statute.</section>
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

  @with_ids ~s"""
  <section class="level-0 non-meta outline" id="1"><h2>1.</h2>No person shall be criminally responsible under this Statute for conduct prior to the entry into force of the Statute.</section>
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

  @without_ids_small_case ~s"""
  <section class="level-0 non-meta outline"><h2>1.</h2>Res ipsa loquitur</section>
  """

  @with_ids_small_case ~s"""
  <section class="level-0 non-meta outline" id="1"><h2>1.</h2>Res ipsa loquitur</section>
  """

  test "handles small case" do
    assert add_pinpoint_ids(@without_ids_small_case) == @with_ids_small_case
  end

  # test "handles typical case" do
  #   assert add_pinpoint_ids(@without_ids) == @with_ids
  # end

  #
  # .add_typography
  #

  test "converts single quotes" do
    assert add_typography("dog's life") == "dog’s life"
  end

  test "converts double quotes" do
    assert add_typography("\"Hey!\"") == "“Hey!”"
  end

  #
  # .add_html_typography
  #

  test "creates simple fractions" do
    plaintext = "on 1/2 of an egg"
    expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

    assert add_html_typography(plaintext) == expected
  end
end
