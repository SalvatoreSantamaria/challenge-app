class Student < ApplicationRecord
    #student is team, need to update
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: {minimum: 5, maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 105},
        uniqueness: {case_sensitive: false},
        format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    
    has_many :student_courses
    has_many :courses, through: :student_courses #link that connects in model - give a relation with course, but not directly, through student_courses
    
    
    belongs_to :scores #this means student is the many side of a one to many association
    validates :student_id, presence: true #ensures that a student id is present
end