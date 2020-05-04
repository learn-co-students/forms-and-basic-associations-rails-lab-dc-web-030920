class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }
  
  def artist_name=(artist_name)
    fa = Artist.find_or_create_by(name: artist_name)
    self.artist = fa 
  end

  def artist_name 
    if self.artist
      self.artist.name
    else
      nil
    end
  end

end