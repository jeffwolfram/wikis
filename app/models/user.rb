class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
enum role: [:admin, :standard, :premium]
after_initialize :set_default_role, :if => :new_record?

def set_default_role
  self.role ||= :standard
end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
