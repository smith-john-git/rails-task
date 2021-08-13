require 'csv'

class EstatesController < ApplicationController

  def new
    @estate = Estate.new
  end

  def create
    uploaded_io = params[:estate][:data]
    Rails.logger.debug uploaded_io.read
  end
end
