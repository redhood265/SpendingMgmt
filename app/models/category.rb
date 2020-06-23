class Category < ApplicationRecord
    scope :category_list, -> { all.pluck(:name, :id)}
end
