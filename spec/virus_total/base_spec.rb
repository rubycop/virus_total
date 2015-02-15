require "virus_total"

describe VirusTotal::Base do
  let(:resource_param) { "first, second" }
  let(:resource) { base.instance_variable_get("@resource") }
  let(:base) { VirusTotal::Base.new(resource_param, "invalid_key") }

  it "raises AuthError "\
     "if you do not have the required priviledges" do
    expect { base.api_response("url/scan") }.
      to raise_error(VirusTotal::AuthError)
  end

  context "for resource parameter" do
    it "returns resource correctly" do
      resource.to_str.should == "first, second"
    end

    let(:resource_param) { ["first", "second"] }

    it "split resources array correctly" do
      resource.to_str.should == "first, second"
      resource.to_str("\n").should == "first\nsecond"
    end
  end
end
