class User < ActiveRecord::Base
    searchable do
      text :first_name
      text :last_name
      text :data
    end
end