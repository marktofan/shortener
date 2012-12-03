class Link < ActiveRecord::Base
  include FriendlyId
  attr_accessible :url, :slug

  friendly_id do |config|
    config.base = :generate_short_url
    config.use :slugged
    config.sequence_separator = ""
  end


  validates :url, :presence => true, :uri => {:format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix}


  # override friendly id method to don't parameterize the field
  def normalize_friendly_id(string)
    string.to_s
  end

  def generate_short_url

    hash= Digest::SHA1.hexdigest self.url
    hash = Base64.encode64 hash
    self.slug = hash[0..7]
  end


end
