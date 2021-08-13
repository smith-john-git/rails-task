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
  end
end


