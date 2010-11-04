class User < ActiveRecord::Base
    define_index do
        # fields
        indexes first_name, :sortable => true
        indexes last_name
        indexes data
      end 
end