class Business < ApplicationRecord
	before_create :randomize_id
	has_many :contacts


  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "id_value", "name", "updated_at", "user_id"]
  end


private

 def randomize_id
   begin
   self.id = SecureRandom.random_number(1_000_000_000)
   end while User.where(id: self.id).exists?
  end
  
end
