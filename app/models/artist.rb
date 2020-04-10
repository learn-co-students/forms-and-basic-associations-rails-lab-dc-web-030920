class Artist < ActiveRecord::Base
  # add associations here
  has many :songs
end
