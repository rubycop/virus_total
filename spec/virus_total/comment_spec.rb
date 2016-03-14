require "virus_total"

describe VirusTotal::Comment do
  let(:api_key) { "b9f4c087d347d244685fa1ba067b3863"\
                  "59dd9f46e88558a3f95061e5d4673d5e" }
  let(:resource) { "da39a3ee5e6b4b0d3255bfef95601890afd80709" }
  let(:comment) { VirusTotal::Comment.new(resource, api_key) }

  context "for 'comments/put'" do
    subject { comment.put "This is a test comment" }
    it_should_behave_like 'single resource'
  end
end
