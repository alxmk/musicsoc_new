class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,                 presence: true, format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
                              
  validates :password,              length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  has_many :bookings
  
  default_scope :order => 'users.email ASC'
  
  def already_booked?
    if admin?
      return false
    else
      uncancelled_bookings = bookings.find_all_by_cancelled(false)
      if !uncancelled_bookings.empty?
        uncancelled_bookings.each do |ub|
          if ub.booking_time >= Date.today
            return true
          end
        end
      else
        return false
      end
      return false
    end
  end
  
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

