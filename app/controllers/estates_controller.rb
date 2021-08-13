require 'csv'

class EstatesController < ApplicationController
  def index
    @estates = Estate.page(params[:page])
  end

  def import
    @estate = Estate.new
  end

  def upload
    csv = get_csv
    logger.debug csv
    csv.each do |row|
      # logger.debug row.to_hash
      encoded = encode_hash(row.to_hash)
      centre_id = encoded['centre_id']
      logger.debug centre_id
      logger.debug Estate.exists?(131)
      if Estate.exists?(centre_id: centre_id)
        estate = Estate.find(centre_id)
        estate.update!(encoded.except(:centre_id))
      else
        estate = Estate.new(encoded)
        estate.save!
      end
    end
    redirect_to action: :index, page: 1
  end

  protected
  def get_csv
    uploaded_io = params[:data]
    csv_string = uploaded_io.read
    CSV.parse(csv_string, headers: true)
  end


end
