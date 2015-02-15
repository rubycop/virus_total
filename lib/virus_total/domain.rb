module VirusTotal
  # to use this feature you must have a private apikey!
  class Domain < Base
    def report
      api_response('domain/report', resource: resource, method: :get)
    end
  end
end
