module Parsable
  extend ActiveSupport::Concern
  
  private
  
  def parser_txt(file, header_attributes)
    File.readlines(file.path).drop(1).map do |line|
      header_attributes.zip(line.chomp.split("\t")).to_h
    end
  end
end
