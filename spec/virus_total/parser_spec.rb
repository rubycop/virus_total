require "virus_total"

describe VirusTotal::Parser do
  let(:response) {
    "{\"permalink\":\"https://www.virustotal.com/url\","\
    "\"resource\":\"https://www.example.com\","\
    "\"response_code\":1,"\
    "\"scans\":{\"CLEAN MX\":{\"detected\":true}}}"
  }
  let(:parser) { VirusTotal::Parser.new(response) }

  it "parse response correctly" do
    parser.instance_variable_get("@response").should_not be_nil
  end

  it "returns info correctly" do
    parser.info.should_not match(/scans/)
  end

  it "returns dangers correctly" do
    parser.dangers.should == {"CLEAN MX"=>{"detected"=>true}}
  end

  it "returns danger brands correctly" do
    parser.danger_brands.should == ["CLEAN MX"]
  end

  it "returns hash value correctly" do
    parser.response_code.should == 1
  end
end

describe Hash do
  let(:hash) { {"key1"=>"val1", "key2"=>{"key 3"=>"val3"}} }

  it "returns hash value if we call method "\
     "with the same name as a hash key" do
    hash.key1.should == "val1"
  end

  it "uses method with double underscore "\
     "if hash key with a space" do
    hash.key2.key_3.should == "val3"
  end
end
