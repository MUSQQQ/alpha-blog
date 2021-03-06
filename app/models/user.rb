class User < ApplicationRecord
    has_many :articles  #One user can write and post many articles, defining a relation
    #constans are declared by names made out of caps letters only
    REGEX_FORM = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 20}
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}, format: {with: REGEX_FORM}

end