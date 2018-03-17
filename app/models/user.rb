class User < ApplicationRecord
  has_many :paletes,dependent: :destroy
  validates_presence_of :username,:ip_addr

  def find_fav_color
   self.paletes.group(:code).count.sort {|a1,a2| a2[1]<=>a1[1]}.first[0]
  end
end
