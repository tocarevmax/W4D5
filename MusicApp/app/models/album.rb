# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  studio     :boolean          default(TRUE)
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates :title, :year, :band_id, presence: true
  validates :studio, inclusion: {in: [true, false]}

  belongs_to :band

  has_many :tracks,
    dependent: :destroy
end
