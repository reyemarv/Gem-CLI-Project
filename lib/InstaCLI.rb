#environment file
#load all files needed to run app

require "nokogiri"
require "open-uri"

require "InstaCLI/version"
require "InstaCLI/cli"
require "InstaCLI/instagrams"
require "InstaCLI/scraper"

require "pry"

module InstaCLI
  class Error < StandardError; end
  # Your code goes here...
end
