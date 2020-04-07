class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre 
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end


  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_entry=(content)
    content.each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

  def note_entry
    ret = []
    self.notes.each do |note|
      ret << note.content unless note.content.empty?
    end
    ret
  end
end


