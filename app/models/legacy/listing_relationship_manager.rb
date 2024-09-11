# Listing relationship manager legacy model
module Legacy
  class ListingRelationshipManager < ApplicationRecord
    self.table_name = "users_user"
    has_many :listings, class_name: 'Legacy::Listing', foreign_key: 'seller_relation_manager_id'
  end
end
