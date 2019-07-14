require 'hackety_hack/lessons/version'
require 'hackety_hack/lessons/rails/engine' if defined?(Rails)

require 'metadown'

module HacketyHack
  module Lessons
    extend self

    FILE_LIST = Dir["#{File.dirname(__FILE__)}/../../content/*.md"]

    def titles
      all.collect{|data| data.metadata["title"]}
    end

    def slugs
      all.collect{|data| data.metadata["slug"]}
    end

    def find_by_title(title)
      all.find{|data| data.metadata["title"] == title}
    end

    def find_by_slug(slug)
      all.find{|data| data.metadata["slug"] == slug}
    end

    def all
      FILE_LIST.collect{|file| Metadown.render(File.read(file, :encoding => "utf-8")) }
    end

    def static_directory
      "#{File.dirname(__FILE__)}/../../static"
    end
  end
end
