module VirusTotal
  # to use this feature you must have a private apikey!
  class Ip < Base
    def report
      api_response('ip-address/report', resource: resource, method: :get)
    end
  end
end
