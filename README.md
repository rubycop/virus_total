# VirusTotal [![Gem Version](https://badge.fury.io/rb/virus_total.png)](http://badge.fury.io/rb/virus_total)
{<img src="https://codeclimate.com/github/rubycop/virus_total/badges/coverage.svg" />}[https://codeclimate.com/github/rubycop/virus_total]

Ruby gem for VirusTotal API v2.0

Home page: https://www.virustotal.com
API page: https://www.virustotal.com/en/documentation/public-api

VirusTotal is a free service that analyzes suspicious files and URLs and facilitates the quick detection of viruses, worms, trojans, and all kinds of malware.

## Installation

Add this line to your application's Gemfile:

    gem 'virus_total'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install virus_total

## Usage
### Scanning Url
```ruby
# initialize
url = VirusTotal::Url.new("https://www.example.com", "-- PUBLIC API KEY --")

resp_str = url.scan   # response from POST "url/scan"
resp_str = url.report # response from POST "url/report"
```
### Scanning File
```ruby
# initialize
file = VirusTotal::File.new("path/to/file", "-- PUBLIC API KEY --")

resp_str = file.scan   # response from POST "file/scan"
resp_str = file.report # response from POST "file/report"
resp_str = file.rescan # response from POST "file/rescan"
```

#### Parse response string
```ruby
parser = Parser.new(resp_str)
##<VirusTotal::Parser:0x0000000252eac0 @json_resp={
# "permalink"=>"https://www.virustotal.com/url/.../",
# "resource"=>"https://www.example.com",...,
# "scans"=>{"CLEAN MX"=>{"detected"=>true, "result"=>"clean site"},...}}>

parser.response_code  #=> 1: OK, 0: result doesn't exist, -2: still queued

# general info from response
parser.info    #=> {"permalink"=>"https://www.virustotal.com/url/.../",
                    "resource"=>"https://www.example.com",...}

# scanning info
parser.scans   #=> {"CLEAN MX"=>{"detected"=>true, "result"=>"clean site"},...}

# information about positive threats
parser.dangers #=> {"CLEAN MX"=>{"detected"=>true, "result"=>"clean site"}}

# antiviruses which found positive threats
parser.danger_brands #=> ["CLEAN MX"]
```
Also we can get any key/value pair from response hash. If key (its a string) from response has a whitespaces use underscore instead between words.
```ruby
parser.scans.CLEAN_MX          #=> {"detected"=>true, "result"=>"clean site"}
parser.scans.CLEAN_MX.detected #=> true
```
### Implemented but not testing yet (needs a private apikey)
#### Scanning IP-Address
```ruby
# initialize
ip = VirusTotal::Ip.new("1.1.1.1", "-- PRIVATE API KEY--")

resp_str = ip.report # response from GET "ip-address/report"
```
#### Scanning Domain
```ruby
# initialize
domain = VirusTotal::Domain.new("example.com", "-- PRIVATE API KEY--")

resp_str = domain.report # response from GET "domain/report"
```
### Unsupported
* "comments/puts"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

