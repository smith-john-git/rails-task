require 'csv'

class EstatesController < ApplicationController
  def index
    @estates = Estate.page(params[:page])
  end

  def import
    @estate = Estate.new
  end

  def upload
    csv = get_csv(params[:data])
    CsvPersistor.new(csv).persist_csv
    redirect_to action: :index, page: 1
  end

  private

  def get_csv(uploaded_file)
    CSV.parse(uploaded_file.read, headers: true)
  end

end


