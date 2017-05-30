class ListItem < ActiveRecord::Base
belongs_to :list
belongs_to :user
belongs_to :item
end
