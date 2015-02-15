module VirusTotal
  class Url < Base
    def scan
      api_response("url/scan", url: @resource.to_str("\n"))
    end

    def report
      api_response("url/report", resource: @resource.to_str)
    end
  end
end
