module Paperclip
  class Rotator < Processor
    attr_accessor :source_file_options, :convert_options

    def initialize(file, options = {}, attachment = nil)
      super

      # TODO: understand this
      @source_file_options  = options[:source_file_options]
      @source_file_options  = @source_file_options.split(/\s+/) if @source_file_options.respond_to?(:split)

      @convert_options      = options[:convert_options]
      @convert_options      = @convert_options.split(/\s+/)     if @convert_options.respond_to?(:split)

      # the file's original extension
      @current_format       = File.extname(@file.path)

      # the filename without the extension
      @basename             = File.basename(@file.path, @current_format)

      if options[:style] == :rotated
        @rotation           = options[:rotation] || false
      else
        @rotation           = false
      end
    end

    def convert_options?
      !@convert_options.nil? && !@convert_options.empty?
    end

    def make
      unless @rotation
        return File.open(@file.path)
      end

      src = @file
      dst = TempfileFactory.new.generate(@basename + '-rotated' + @current_format)

      parameters = []
      parameters << source_file_options
      parameters << ":source"
      parameters << '-rotate "-90"' # transformation command
      parameters << convert_options
      parameters << ":dest"

      parameters = parameters.flatten.compact.join(" ").strip.squeeze(" ")

      begin
        convert(parameters, source: File.expand_path(src.path), dest: File.expand_path(dst.path))
      rescue Cocaine::ExitStatusError => e
        raise Paperclip::Error, e
        # raise Paperclip::Error, "There was an error processing the thumbnail for #{@basename}"
      end

      dst
    end
  end
end
