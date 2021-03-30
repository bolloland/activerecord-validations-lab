class Post < ActiveRecord::Base
    validates :title, presence: :true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction, Non-Fiction) }
    validate :clickbait?

    WORDS = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i ]
    
    def clickbait?
        if :title.match(WORDS)
        errors.add(:title, "not clickbaity enough")
        end
    end
end
