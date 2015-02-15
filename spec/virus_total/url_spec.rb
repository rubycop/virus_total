require "virus_total"

describe VirusTotal::Url do
  let(:api_key) { "97bed3fb1eaf1d7e408d4f21735c26b0"\
                  "8453bcf64957e3a370e6fb56133bfe60" }
  let(:resource) { VirusTotal::Url.new(uri, api_key) }

  context "for single url" do
    let(:uri) { "https://www.google.com" }

    context "for 'url/scan'" do
      subject { resource.scan }
      it_should_behave_like 'single resource'
    end

    context "for 'url/report'" do
      subject { resource.report }
      it_should_behave_like 'single resource'
    end
  end

  context "for multiply urls" do
    let(:api_key) { "b9f4c087d347d244685fa1ba067b3863"\
                    "59dd9f46e88558a3f95061e5d4673d5e" }
    let(:uri) {
      ["http://www.google.com", "http://www.virustotal.com"]
    }

    context "for 'url/scan'" do
      subject { resource.scan }
      it_should_behave_like 'multiply resources'
    end

    # url/report not working for multiply urls.
    skip "for 'url/report'" do
      subject { resource.report }
      it_should_behave_like 'multiply resources'
    end
  end
end
