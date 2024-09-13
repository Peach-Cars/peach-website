# Buyer lead model
class BuyerLead < Lead
  validates :listing_id, :requested_financing, :lead_source, presence: true
  belongs_to :listing, class_name: 'Legacy::Listing', foreign_key: 'listing_id'
end
