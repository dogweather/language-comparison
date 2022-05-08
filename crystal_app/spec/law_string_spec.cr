require "./spec_helper"

describe LawString do
  it "works for a single quote" do
    LawString.double_quotes("Robb's dog").should eq("Robb’s dog")
  end

  it "works for double quotes" do
    LawString.double_quotes("\"Hello\"").should eq("“Hello”")
  end
end
