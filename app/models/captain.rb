class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where(classifications: { name: 'Catamaran'})
  end

  def self.sailors
    includes(boats: :classifications).where(classifications: { name: 'Sailboat'}).uniq
  end

  def self.talented_seafarers
    where("id IN (?)", self.sailors.pluck(:id)
  end
end
