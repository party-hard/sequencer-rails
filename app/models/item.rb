class Item < ActiveRecord::Base
  belongs_to :user
  self.primary_key = 'uid'

  def to_param
    uid
  end
end
