class Admin::WordsController < ApplicationController
  before_action :logged_in_user, :logged_in_as_admin
  before_action :load_data, only: [:create, :index]
  before_action :load_word, only: :destroy

  def index
    @word = Word.new
    @word.answers.build
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "word_created"
      redirect_to admin_words_path
    else
      render :index
    end
  end

  def destroy
    if @word.destroy
      flash[:sucess] = t "word_deleted_success"
    else
      flash[:danger] = t "word_deleted_fail"
    end
    redirect_to :back
  end

  private
    def word_params
      params.require(:word).permit :name, :content, :category_id,
        answers_attributes: [:answer_content, :is_correct]
    end

    def load_data
      @words = Word.search_name(params[:search]).order_name
        .paginate page: params[:page], per_page: Settings.per_page.words
      @categories = Category.all
    end
end
