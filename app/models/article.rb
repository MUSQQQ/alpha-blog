class Article < ApplicationRecord
    belongs_to :user    #article can only be made by one user
    has_many :article_categories
    has_many :categories, through: :article_categories  # many-many implementation
    validates :title, presence: true, length: {minimum: 6, maximum: 100}    #title is needed to be present in every article + minimum and maximum length of them
    validates :description, presence: true, length: {minimum: 10, maximum: 300}  #same but with description
end
