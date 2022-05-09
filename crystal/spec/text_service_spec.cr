require "./spec_helper"

include TextService

describe TextService do
  describe "add_typography()" do
    it "converts single quotes" do
      actual   = add_typography("dog's life")
      expected = "dog’s life"

      actual.should eq expected 
    end

    it "converts double quotes" do
      actual   = add_typography("\"Hey!\"")
      expected = "“Hey!”"

      actual.should eq expected
    end
  end

  describe "add_html_typography()" do
    it "creates simple fractions" do
      plaintext = "on 1/2 of an egg"
      expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

      add_html_typography(plaintext).should eq expected
    end
  end
end
