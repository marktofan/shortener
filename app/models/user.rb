class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :link
  has_and_belongs_to_many :roles


  def role?(role)
    !!self.roles.find_by_name(role.to_sym)
  end

  def roles_keys

    list=[]

    if self.roles.any?
      self.roles.each do |r|
        list.append(r.name.to_sym)
      end
    elsif list.append(:guest)
    end

    list
  end

end
