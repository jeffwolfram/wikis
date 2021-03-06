class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators


  def collaborator_for(user)
    collaborators.find_by(user: user)
  end


end
