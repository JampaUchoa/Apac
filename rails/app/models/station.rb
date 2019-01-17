class Station < ApplicationRecord
    belongs_to :microregion
    has_many :collections
end
