class Words < ActiveRecord::Base
  validates_format_of :words, :with => /[\w ]+/i
end
