module User::Models
  class User  < ApplicationRecord
    self.implicit_order_column = "created_at"
    self.table_name = "users"
  end
end