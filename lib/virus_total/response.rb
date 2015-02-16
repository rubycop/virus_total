require 'json'

module VirusTotal
  class Response

    attr_reader :response

    def initialize(resp)
      @response = JSON.parse(resp)
    end

    def info
      return unless @response

      @response.tap { |hash| hash.delete("scans") }
    end

    def dangers
      return {} unless scans

      dangers = {}
      scans.each_pair do |key, hash|
        next unless hash["detected"]

        dangers.merge!({ key => hash })
      end

      dangers
    end

    def danger_brands
      dangers.keys
    end

    def method_missing(name, *args)
      @response[name.to_s]
    end
  end
end
