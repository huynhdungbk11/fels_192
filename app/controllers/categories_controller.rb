class CategoriesController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.alphabetically.paginate(page: params[:page])
      .per_page Settings.per_page.category
  end
end
