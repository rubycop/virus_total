require "virus_total"

describe VirusTotal::Base do
  let(:resource_param) { "first, second" }
  let(:base) { VirusTotal::Base.new(resource_param, "invalid_key") }

  it "raises AuthError "\
     "if you do not have the required priviledges" do
    expect { base.api_response("url/scan") }.
      to raise_error(VirusTotal::AuthError)
  end

  context "for resource parameter" do
    it "returns resource correctly" do
      base.resource.should == "first, second"
    end

    let(:resource_param) { ["first", "second"] }

    it "split resources array correctly" do
      base.resource.should == "first, second"
      base.resource("\n").should == "first\nsecond"
    end
  end
end
