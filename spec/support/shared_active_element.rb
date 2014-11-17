RSpec.shared_examples "an active element" do
  let(:resolver) { HungryForm::Resolver.new() }
  
  let(:group_options) { {} }
  let(:group) { HungryForm::Group.new(:group, nil, resolver, group_options) {} }

  let(:element_options) { {} }
  let(:element) { described_class.new(:element_name, group, resolver, element_options) {} }

  it_behaves_like "an element"

  describe ".new" do
    it "should have empty error" do
    	expect(element.error).to eq ""
    end

    it "should not be required if its parent is not visible" do
    	group_options[:visible] = false
    	element_options[:required] = true
    	expect(element.required?).to eq false
  	end
  end

  describe "#valid?" do
		describe "when required" do
			before(:each) do
				element_options[:required] = true
			end

			it "is valid" do
				element.value = "value"
				expect(element.valid?).to eq true
			end

			it "is invalid" do
				element.value = ""
				expect(element.valid?).to eq false
			end
		end
	end
end