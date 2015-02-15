module VirusTotal
  class File < Base
    def scan
      api_response('file/scan', file: get_file, multipart: true)
    end

    def rescan
      api_response('file/rescan', resource: @resource.to_str)
    end

    def report
      api_response('file/report', resource: @resource.to_str)
    end

    private

    def get_file
      tmp = Tempfile.open('tmp')
      tmp.write(IO::File.read(@resource.to_str))
      tmp
    end
  end
end
