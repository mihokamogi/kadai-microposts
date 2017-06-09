class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.find_or_create_by(micropost: @micropost)
    flash[:success] = 'このmicropostをお気に入りに追加しました。'
    redirect_to current_user
  end
  
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(@micropost)
    flash[:success] = 'このmicropostをお気に入りから解除しました。'
    redirect_to current_user
  end
end
