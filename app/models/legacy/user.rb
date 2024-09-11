# User legacy model
module Legacy
  class User < ApplicationRecord
    self.table_name = "users_user"
  end
end
