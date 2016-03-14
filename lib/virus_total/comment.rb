module VirusTotal
  class Comment < Base
    def put(text)
      api_response('comments/put', resource: resource, comment: text)
    end
  end
end
