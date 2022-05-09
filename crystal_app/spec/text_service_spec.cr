require "./spec_helper"

describe TextService do
  describe "add_typography()" do
    it "converts single quotes" do
      expect("dog's life".add_typography).to eq "dog’s life"
    end

    it "converts double quotes" do
      expect("\"Hey!\"".add_typography).to eq "“Hey!”"
    end
  end

  describe "add_html_typography()" do
    it "creates simple fractions" do
      plaintext = "on 1/2 of an egg"
      expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"
      expect(plaintext.add_html_typography).to eq expected
    end
  end
end
