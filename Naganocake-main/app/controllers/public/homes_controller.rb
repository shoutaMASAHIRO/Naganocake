class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]

  def top
    @genres = Genre.only_active.includes(:items)
    @items = Item.recommended
  end

  def about
  end
end
