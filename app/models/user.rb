class User < ActiveRecord::Base
  has_many :authorizations, :dependent => :destroy
  has_many :shopping_lists, :dependent => :destroy

  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'])
  end
  
end
