class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :spells
  
end

class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    params.require(:user).permit(:account_update, keys: %i[password current_password])
    params.require(:user).permit(:register, keys: %i[password email])
  end
end

