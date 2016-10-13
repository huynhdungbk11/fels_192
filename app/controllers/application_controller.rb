class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:warning] = t "category_isnt_exist"
      redirect_to root_url
    end
  end
end
