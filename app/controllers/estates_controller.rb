require 'csv'

class EstatesController < ApplicationController
  def index
    @estates = Estate.page(params[:page])
  end

  def import
    @estate = Estate.new
  end

  def upload
    uploaded_io = params[:data]
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
    redirect_to action: :index, page: 1
  end
end


