class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  
  def user_private

  end
end
