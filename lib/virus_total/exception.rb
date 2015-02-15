module VirusTotal
  # Whenever you exceed the public API request rate limit
  # a 204 HTTP status code is returned.
  class ExceedApiLimitError < StandardError
    def message; "you exceed the public API request rate limit"; end
  end

  # If you try to perform calls to functions for which you do not have
  # the required privileges an HTTP Error 403 Forbidden is raised
  class AuthError < StandardError
    def message; "you do not have the required priviledges"; end
  end
end
