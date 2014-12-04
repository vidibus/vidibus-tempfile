module Vidibus
  class Tempfile < ::Tempfile
    VERSION = '0.0.1'

    def initialize(path, tmpdir = Dir::tmpdir)
      @original_filename = File.basename(path)
      @path = path
      super(@original_filename, tmpdir)
      fetch
    end

    def fetch
      return unless File.file?(@path)
      self.write(File.read(@path))
      self.rewind
      self
    end

    def original_filename
      @original_filename
    end

    def content_type
      mime = `file --mime -br #{self.path}`.strip
      mime.gsub!(/^.*: */,"")
      mime.gsub!(/(;|,).*$/,"")
      mime
    end

    # Replaces Tempfile's +make_tmpname+ with one that honors file extensions.
    # Copied from Paperclip
    def make_tmpname(basename, n)
      extension = File.extname(basename)
      sprintf("%s,%d,%d%s", File.basename(basename, extension), $$, n.to_i, extension)
    end
  end
end
