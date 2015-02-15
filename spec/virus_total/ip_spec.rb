require "virus_total"

# to use this feature you must have a private apikey!
describe VirusTotal::Ip do
  let(:api_key) { "--YOUR_PRIVATE_KEY--" }
  let(:ip) { VirusTotal::Ip.new("128.0.0.1", api_key) }

  skip "for single ip address" do
    context "for 'ip-address/report'" do
      subject { ip.report }
      it_should_behave_like 'single resource'
    end
  end
end
