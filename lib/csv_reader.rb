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
      end
    end
end

class String 
  def underscore 
