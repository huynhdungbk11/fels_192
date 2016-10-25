module LessonsHelper
  def lesson_status lesson
    if lesson.is_finished?
      link_to t("view"), edit_category_lesson_path(lesson.category, lesson),
        class: "lesson_button_view"
    else
      link_to t("start"),edit_category_lesson_path(lesson.category, lesson),
        class: "lesson_button_start"
    end
  end
end
