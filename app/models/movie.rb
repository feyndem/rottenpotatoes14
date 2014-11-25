class Movie < ActiveRecord::Base

  before_save :capitalize_title

  def self.all_ratings
    %w[G PG PG-13 N R NC-17]
  end

  validates :title, :presence => true
  validates :release_date, :presence => true
  #validates :released_1930_or_later
  validates :rating, :inclusion => {:in => Movie.all_ratings}, :unless => :grandfathered?

  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end

  def released_1930_or_later
    errors.add(:release_date, 'Must be 1930 or later') if release_date && release_date < Date.parse('1 Jan 1930')
  end

  @@grandfathered_date = Date.parse('1 Nov 1968')

  def grandfathered?
    release_date && release_date < @@grandfathered_date
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

end
