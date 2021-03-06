class User < ActiveRecord::Base
  validates :username, :presence => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :things
  has_many :wants
  has_many :pending_wants, -> {where :'wants.finished' => false}, :through => :things, :source => :wants
  has_many :related_events, :as => :reader
end
