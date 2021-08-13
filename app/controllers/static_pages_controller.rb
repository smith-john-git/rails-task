class StaticPagesController < ApplicationController
  STATIC_PAGES = {
    'internal-error': 'internal_error',
    'not-found': 'not_found'
  }.freeze

  def show
    if STATIC_PAGES[params[:page].to_sym].nil?
      render (STATIC_PAGES['not-found'.to_sym]).to_s
    else
      render (STATIC_PAGES[params[:page].to_sym]).to_s
    end
  end
end