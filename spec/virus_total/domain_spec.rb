require "virus_total"

# to use this feature you must have a private apikey!
describe VirusTotal::Domain do
  let(:api_key) { "--YOUR_PRIVATE_KEY--" }
  let(:domain) { VirusTotal::Domain.new("heroku.com", api_key) }

  pending "for single domain" do
    context "for 'domain/report'" do
      subject { domain.report }
      it_should_behave_like 'single resource'
    end
  end
end
