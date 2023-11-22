class Business < ApplicationRecord
	before_create :randomize_id
	has_many :contacts


private

 def randomize_id
   begin
   self.id = SecureRandom.random_number(1_000_000_000)
   end while User.where(id: self.id).exists?
  end
  
end
