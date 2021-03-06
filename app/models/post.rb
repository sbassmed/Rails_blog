# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  belongs_to :user

  has_many :comments

  validates :user, presence: {message:"Usuario donde estas?"}
  validates :title, :body, presence: {message: " No puede estar en blanco"}
  validates :body, length: {minimum: 250, message: " Ingresa al menos 250 caracteres"}

end
