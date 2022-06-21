require "./spec_helper"

describe PinpointXref do
  describe ".add_pinpoint" do
    without = %q[<section class="level-0 non-meta outline" id="2"><h2><a title="Permanent link" href="#2">2.</a></h2>If a State becomes a Party to this Statute after its entry into force, the Court may exercise its jurisdiction only with respect to crimes committed after the entry into force of this Statute for that State, unless that State has made a declaration under <a data-toggle="tooltip" title="Preconditions to the exercise of jurisdiction" href="article_12_preconditions_to_the_exercise_of_jurisdiction">article 12</a>, paragraph 3.</section>]
    with___ = %q[<section class="level-0 non-meta outline" id="2"><h2><a title="Permanent link" href="#2">2.</a></h2>If a State becomes a Party to this Statute after its entry into force, the Court may exercise its jurisdiction only with respect to crimes committed after the entry into force of this Statute for that State, unless that State has made a declaration under <a data-toggle="tooltip" title="Preconditions to the exercise of jurisdiction" href="article_12_preconditions_to_the_exercise_of_jurisdiction#3">article 12, paragraph 3</a>.</section>]

    PinpointXref.add_pinpoint(without).should eq with___
  end
end
