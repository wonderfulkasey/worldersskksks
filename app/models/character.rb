class Character < ActiveRecord::Base
    belongs_to :world
    has_many :items
end