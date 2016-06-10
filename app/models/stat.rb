class Stat < ActiveRecord::Base
  belongs_to :statable, polymorphic: :true
end
