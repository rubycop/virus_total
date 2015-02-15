require 'rest-client'

module VirusTotal
  class Base
    BASE_URL = "https://www.virustotal.com/vtapi/v2/"

    attr_reader :apikey, :resource

    def initialize(resources, apikey)
      @resource = resources
      @apikey   = apikey
    end

    def api_response(url, params = {})
      full_url = BASE_URL + url
      params = default_params.merge(params)

      api_request(full_url, params)
    end

    private

    def default_params
      { 'apikey' => @apikey, method: :post }
    end

    def api_request(url, params)
      RestClient.send(params[:method], url, params) do |resp, req, result, &block|
        raise ExceedApiLimitError if resp.code == 204
        raise AuthError           if resp.code == 403

        resp.return!(req, result, &block)
      end
    end
  end
end
