class WordsController < ApplicationController
  def index
    @words = Word.search_name(params[:search]).order_name
      .paginate page: params[:page], per_page: Settings.per_page.words
  end

  def show
    @word = Word.find_by id: params[:id]
    unless @word
      flash[:warning] = t "record_isnt_exist"
      redirect_to words_path
    end
  end
end
