class User < ApplicationRecord
  after_save :initializeDash
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
         
  validates :email, presence: true
  
  has_many :userplays
  has_many :players, through: :userplays
  
  has_many  :usercamps
  has_many  :campaigns, through: :usercamps
  
  has_one  :dash
  
  private
    def initializeDash
       puts "Boom shakalakah" 
    end
  
end

