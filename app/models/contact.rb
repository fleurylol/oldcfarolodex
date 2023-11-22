class Contact < ApplicationRecord

	  has_many_attached :images
    has_rich_text :notes
    belongs_to :user
    belongs_to :business
    accepts_nested_attributes_for :business
    before_create :randomize_id

    validates :guest_name, presence: true
    validates :address, presence: true
    validates :phone, presence: true
    validates :email, presence: true

	def self.ransackable_attributes(auth_object = nil)
    ["address", "business", "created_at", "guest_name", "id", "id_value", "phone", "updated_at"]
  end

def self.ransackable_associations(auth_object = nil)
    ["images_attachments", "images_blobs"]
  end

  private


 def randomize_id
   begin
   self.id = SecureRandom.random_number(1_000_000_000)
   end while User.where(id: self.id).exists?
  end
end 