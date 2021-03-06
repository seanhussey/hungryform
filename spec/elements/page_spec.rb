require "spec_helper"

describe HungryForm::Elements::Page do
  let(:resolver) { HungryForm::Resolver.new() }
  let(:options) { {} }
  let(:page) { HungryForm::Elements::Page.new(:pagename, nil, resolver, options) {} }

  it_behaves_like "a group"

  describe ".new" do
    it "should have one element" do
      page = HungryForm::Elements::Page.new(:pagename, nil, resolver, options) do
        html :html_name, value: "<p>Test html block</p>"
      end
      expect(page.elements.size).to eq 1
    end
  end

  describe "#group" do 
    it "should contain a group" do
      page.group(:group_name, {}) {}
      expect(page.elements.first.class).to eq HungryForm::Elements::Group
    end
  end
end