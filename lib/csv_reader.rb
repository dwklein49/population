class CSVReader

  attr_accessor :fname

  #grabs the file
  def initialize(filename)
      @fname = filename 
  end

  def headers=(header_str)
      @headers = header_str.split(",")
      @headers.map! do |h|

        #the following code will remove the quotes
        h.gsub('"', '')
        h.strip!

        h.underscore.to_sym
      end
    end
    def create_hash(values)
      h = {}
      @headers.each_with_index do |header, i|
        # remove new lines from the value
        value = values[i].strip.gsub('"', '')
        h[header] = value unless value.empty?
      end
      h
    end
    def read
      f = file.new(@fname, 'r')
      #grab the headers
      self.headers = f.readline

      #loop over the lines
      while(!f.eof? && next_line = f.readline)
        values = next_line.split(',')
        hash = create_hash(values)
        yield(hash)
      end
    end
end

class String 
  def underscore 
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end


