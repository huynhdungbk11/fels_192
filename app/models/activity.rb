class Activity < ApplicationRecord
  belongs_to :user

  enum action_type: {create_lesson: 0, update_lesson: 1, follow: 2, unfollow: 3}
  enum target_type: {lesson: 0, user: 1}

  scope :update_desc, ->{order updated_at: :desc}

  def load_activity
    case
    when self.create_lesson?
      target_lesson = find_lesson
      "#{I18n.t "activity_create_lesson"} \"#{target_lesson.category.name}\""
    when self.update_lesson?
      target_lesson = find_lesson
      "#{I18n.t "activity_update_lesson"} \"#{target_lesson.category.name}\""
    end
  end

  def find_lesson
    user.lessons.find_by id: target_id
  end
end
