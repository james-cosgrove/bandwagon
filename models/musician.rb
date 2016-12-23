class Musician < ActiveRecord::Base
  has_and_belongs_to_many :bands
  has_secure_password
end
