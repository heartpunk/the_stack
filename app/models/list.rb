class List < ActiveRecord::Base
  has_and_belongs_to_many :users, :uniq => true
  has_many :items, :order => "id desc"
  validates_presence_of :name
end
