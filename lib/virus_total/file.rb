module VirusTotal
  class File < Base
    def scan
      api_response('file/scan', file: get_file, multipart: true)
    end

    def rescan
      api_response('file/rescan', resource: resource)
    end

    def report
      api_response('file/report', resource: resource)
    end

    private

    def get_file
      tmp = Tempfile.open('tmp')
      tmp.write(::File.read(resource))
      tmp
    end
  end
end
