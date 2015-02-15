module VirusTotal
  class Url < Base
    def scan
      api_response("url/scan", url: resource("\n"))
    end

    def report
      api_response("url/report", resource: resource)
    end
  end
end
