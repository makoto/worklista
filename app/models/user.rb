class User < ActiveRecord::Base
  has_many :items, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessible :email, :username, :name, :title, :twitter_id, \
  :description, :website, :password, :password_confirmation, :remember_me,\
  :photo

  validates_uniqueness_of :username
#  validates_presence_of :name

  # Override login key to use username OR email
  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    where(["username = :value OR email = :value", { :value => value }]).first
  end

  if Rails.env.production?
    has_attached_file :photo,
                      :storage => :s3,
                      :styles => { :medium => "240x240", :thumb => "80x80",
                                   :original => "300x300"}, 
                      :default_url => "/images/missing-:style.png",
                      :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :bucket => "worklista-dev"
  else
    has_attached_file :photo,
                      :styles => { :medium => "240x240", :thumb => "80x80",
                                   :original => "300x300"}, 
                      :default_url => "/images/missing-:style.png"
  end


  validates_attachment_size :photo, :less_than => 2.megabytes

end
