class Challenge < ApplicationRecord
    #course is  challenges, to update
    validates :name, presence: true, length: {minimum: 1, maximum: 240}
    validates :challenge_points, presence: true, numericality: { only_integer: true }
    # validates :team_id, presence: true
    # validates :short_name, presence: true, length: {minimum: 3, maximum: 15}
    # validates :name, presence: true, length: {minimum: 10, maximum: 300}

    has_many :team_challenges
    has_many :teams, through: :team_challenges #link that connects in model - give a relation with team, but not directly, through team_challenges
end