module Parsable
  extend ActiveSupport::Concern
  
  private
  
  def parser_txt(uploaded_io, header_attributes)
    File.readlines(uploaded_io.path).drop(1).map do |line|
      header_attributes.zip(line.chomp.split("\t")).to_h
    end
  end
end
