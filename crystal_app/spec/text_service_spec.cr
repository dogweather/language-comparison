require "./spec_helper"

describe TextService do
  it "works for a single quote" do
    TextService.double_quotes("Robb's dog").should eq("Robb’s dog")
  end

  it "works for double quotes" do
    TextService.double_quotes("\"Hello\"").should eq("“Hello”")
  end
end
