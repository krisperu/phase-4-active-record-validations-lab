class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
    validate :must_be_clickbait

    def must_be_clickbait
        if title.excludes("Won't Believe", "Secret". "Top [number]", "Guess")
            errors.add(:title, "must be clickbait")
        end
    end
end
