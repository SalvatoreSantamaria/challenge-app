class Course < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1, maximum: 240}
    # validates :short_name, presence: true, length: {minimum: 3, maximum: 15}
    # validates :name, presence: true, length: {minimum: 10, maximum: 300}

    has_many :student_courses
    has_many :students, through: :student_courses #link that connects in model - give a relation with student, but not directly, through student_courses
end