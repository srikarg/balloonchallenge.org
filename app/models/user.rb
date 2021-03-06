class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :team
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :new_user_email

  def new_user_email
    UserMailer.new_user(self).deliver
  end
end
