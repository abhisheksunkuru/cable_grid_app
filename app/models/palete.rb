class Palete < ApplicationRecord
  belongs_to :user

  validates_presence_of :code,:row,:column,:user_id
  after_create_commit { PaleteBroadcastJob.perform_later(self) }

  def self.find_color_code_and_user_stamp(x,y)
    result = []
    palette = Palete.where(row: x,column: y).last
    result = [palette.code,"#{palette.user.username} #{palette.form_time_stamp}"] if palette.present?
    result
  end

  def form_time_stamp
    self.updated_at.strftime("%d-%m-%Y %H:%M:%S")
  end
end
