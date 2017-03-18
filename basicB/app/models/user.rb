class User < ApplicationRecord
  after_create_commit :initializeDash
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
         
  validates :email, presence: true
  
  has_many :userplays
  has_many :players, through: :userplays
  
  has_many  :usercamps
  has_many  :campaigns, through: :usercamps
  
  has_many  :userdashes
  has_many  :dashes, through: :userdashes
  
  private
    def initializeDash
      #
      #
      # add in ownership chain make
      #
      #
       self.dashes.create!(name: self.id)
    end
  
end

