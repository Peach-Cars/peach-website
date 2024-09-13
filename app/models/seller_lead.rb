# Seller leads model
class SellerLead < Lead
  validates :registration_number, :model_id, :year_of_manufacture, :asking_price, :mileage, :consent, :location, presence: true
end
