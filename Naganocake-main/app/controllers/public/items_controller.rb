class Public::ItemsController < ApplicationController
    def index
      @genres = Genre.all
      if params[:genre_id]
        @items = Item.where(genre_id: params[:genre_id])
        @items = Item.where(genre_id: params[:genre_id], is_deleted: false).page(params[:page]).per(9)
      else
        @items = Item.all
        @items = Item.where(is_deleted: false).page(params[:page]).per(9)
      end
    end
  
    def show
      @item=Item.find(params[:id])
      @cart_item =CartItem.new
    end
    
  end