class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :clickbait_title?

    TITLES = [/Won't Believe/i, /Secret/i, /Top\d/i, /Guess/i]

    def clickbait_title?
        if TITLES.none? do |t|
            t.match title
        end
            errors.add(:title, "You need a clickbait title!")
        end
    end
    
end

