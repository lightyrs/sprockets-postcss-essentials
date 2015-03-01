describe SprocketsPostcssEssentials::Processor do
  describe ".process" do
    def processed(css, options = {})
      described_class.process(css, options).strip
    end

    it "processes $variables" do
      css = "$foo: #fff; a { color: $foo }"

      expect(processed(css)).to eq "a { color: #fff }"
    end

    it "processes mixins" do
      css = <<-CSS
        @define-mixin ovh { overflow: hidden; }
        .footer { @mixin ovh; }
      CSS

      expect(processed(css)).to eq ".footer { overflow: hidden; }"
    end

    it "processes nested selector" do
      css = <<-CSS
      .header {
        &-logo { color: red; }
      }
      CSS

      expect(processed(css)).to include ".header-logo"
    end

    it "processes color functions" do
      css = "a { color: color(#fff blackness(+10%)); }"

      expect(processed(css)).to eq "a { color: rgb(232, 232, 232); }"
    end

    xit "processes @import directives" do
      css = "@import 'spec/fixtures/foo';"

      expect(processed(css, from: Dir.pwd + "/index.css")).to eq "a { color: red; }"
    end
  end
end
