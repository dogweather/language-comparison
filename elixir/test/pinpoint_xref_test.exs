import PinpointXref, only: [add_pinpoint: 1]

defmodule PinpointXrefTest do
  @moduledoc """
  Testing the PinpointXref module.
  """

  use ExUnit.Case

  @without_pinpoint ~s[<section class="level-0 non-meta outline" id="2"><h2><a title="Permanent link" href="#2">2.</a></h2>If a State becomes a Party to this Statute after its entry into force, the Court may exercise its jurisdiction only with respect to crimes committed after the entry into force of this Statute for that State, unless that State has made a declaration under <a data-toggle="tooltip" title="Preconditions to the exercise of jurisdiction" href="article_12_preconditions_to_the_exercise_of_jurisdiction">article 12</a>, paragraph 3.</section>]
  @with_pinpoint ~s[<section class="level-0 non-meta outline" id="2"><h2><a title="Permanent link" href="#2">2.</a></h2>If a State becomes a Party to this Statute after its entry into force, the Court may exercise its jurisdiction only with respect to crimes committed after the entry into force of this Statute for that State, unless that State has made a declaration under <a data-toggle="tooltip" title="Preconditions to the exercise of jurisdiction" href="article_12_preconditions_to_the_exercise_of_jurisdiction#3">article 12, paragraph 3</a>.</section>]

  test "handles 'article X, paragraph Y'" do
    assert add_pinpoint(@without_pinpoint) == @with_pinpoint
  end
end
