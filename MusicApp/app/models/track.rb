# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  album_id   :integer          not null
#  regular    :boolean          default(TRUE)
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

  validates :title, :ord, :album_id, presence: true
  validates :regular, inclusion: {in: [true, false]}

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band
end
