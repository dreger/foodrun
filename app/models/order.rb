class Order < ActiveRecord::Base
  UID_HEX_LENGTH = 24
  has_many :items
  validates_presence_of :what
  before_create :generate_uid, :generate_expires_on

  def to_param
    self.uid
  end

  def expired?
    self.expires_on < DateTime.now
  end

  private

  def generate_expires_on
    self.expires_on = DateTime.now + self.expires_in.seconds
  end

  def generate_uid
    self.uid = loop do
      random_uid = SecureRandom.hex(Order::UID_HEX_LENGTH/2)
      break random_uid unless self.class.exists?(uid: random_uid)
    end
  end
end