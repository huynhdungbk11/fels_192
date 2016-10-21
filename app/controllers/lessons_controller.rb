class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :load_lesson, only: :edit
  before_action :load_category, only: :create

  def index
    @lessons = current_user.lessons.update_desc.paginate(page:
      params[:page]).per_page Settings.per_page.lesson
  end

  def create
    @lesson = current_user.lessons.new category: @category
    if @lesson.save
      redirect_to category_lessons_path
    else
      flash[:danger] = t "create_lesson_fail"
      redirect_to categories_path
    end
  end

  def edit
  end

  private
  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
    unless @lesson
      flash[:danger] = t "lesson_isnt_exist"
      redirect_to root_url
    end
  end

  def load_category
    @category = Category.find_by id: params[:category_id]
    unless @category
      flash[:warning] = t "category_isnt_exist"
      redirect_to root_url
    end
  end
end
