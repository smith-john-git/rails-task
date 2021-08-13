require 'csv'

class EstatesController < ApplicationController

  def new
    @estate = Estate.new
  end

  def create
    uploaded_io = params[:estate][:data]
    csv_string = uploaded_io.read
    csv = CSV.parse(csv_string, headers: true)
    logger.debug csv
    csv.each do |row|
      # logger.debug row.to_hash
      encoded = encode_hash(row.to_hash)
      logger.debug encoded['centre_id']
      logger.debug Estate.exists?(131)
      if Estate.exists?(centre_id: encoded['centre_id'])
        estate = Estate.find(encoded['centre_id'])
        estate.update!(encoded.except(:centre_id))
      else
        estate = Estate.new(encoded)
        estate.save!
      end
    end
    # first_line = csv[0]
    # estate = Estate.find(first_line[:centre_id]) rescue nil
    # estate ||= Estate.new(first_line.to_hash)
    # estate.save!
  end
end

def encode_hash(input)
  output = Hash.new
  input.each do |key, value|
    output[key] = value.encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '_') rescue nil
  end
  output
end
