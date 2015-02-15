require "virus_total"

describe VirusTotal::File do
  let(:api_key) { "b9f4c087d347d244685fa1ba067b3863"\
                  "59dd9f46e88558a3f95061e5d4673d5e" }
  let(:resource) {
      tmp = Tempfile.open('tmp')
      tmp.write("some test data")
      tmp.path
  }
  let(:file) { VirusTotal::File.new(resource, api_key) }

  context "for single file" do

    context "for 'file/scan'" do
      subject { file.scan }
      it_should_behave_like 'single resource'
    end

    context "for 'file/report'" do
      let(:resource) { "da39a3ee5e6b4b0d3255bfef95601890afd80709" }

      subject { file.report }
      it_should_behave_like 'single resource'
    end

    context "for 'file/rescan'" do
      let(:resource) { "da39a3ee5e6b4b0d3255bfef95601890afd80709" }

      subject { file.rescan }
      it_should_behave_like 'single resource'
    end
  end

  context "for multiply files" do
    let(:api_key) { "fd59ac48e3005fa3c5e3f08c06fe666b"\
                    "998bf83cd14b6d9cefab9052b1ce76d5" }
    let(:resource) { ["da39a3ee5e6b4b0d3255bfef95601890afd80709",
                      "da39a3ee5e6b4b0d3255bfef95601890afd80709"] }

    context "for 'file/report'" do
      subject { file.report }
      it_should_behave_like 'multiply resources'
    end

    context "for 'file/rescan'" do
      subject { file.rescan }
      it_should_behave_like 'multiply resources'
    end
  end
end
