class Score < ApplicationRecord
    #validates :name, presence: true, length: {minimum: 1, maximum: 240}
    #validates :challenge_points, presence: true, numericality: { only_integer: true }
    # validates :short_name, presence: true, length: {minimum: 3, maximum: 15}
    # validates :name, presence: true, length: {minimum: 10, maximum: 300}

    has_many :students #students is teams. 
end