class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  has_many_attached :photos
end
