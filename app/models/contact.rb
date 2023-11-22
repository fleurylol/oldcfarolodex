class Contact < ApplicationRecord

 has_many_attached :images
 has_rich_text :notes
 belongs_to :user
 belongs_to :business
 before_create :randomize_id

 validates :guest_name, presence: true
 validates :address, presence: true
 validates :phone, presence: true
 validates :email, presence: true

 def self.ransackable_attributes(auth_object = nil)
  ["address", "business_id", "created_at", "email", "guest_name", "id", "id_value", "notes", "phone", "updated_at", "user_id"]
end

def self.ransackable_associations(auth_object = nil)
  ["business", "images_attachments", "images_blobs", "rich_text_notes", "user"]
end


private


def randomize_id
 begin
   self.id = SecureRandom.random_number(1_000_000_000)
 end while User.where(id: self.id).exists?
end
end 