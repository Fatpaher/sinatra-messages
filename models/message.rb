class Message < Sequel::Model
  attr_encrypted :text, key: SECRET_KEY, algorithm: 'aes-256-gcm'
  def validate
    super
    errors.add(:name, "can't be empty") if text && text&.empty?
  end

  def before_save
    super
    self.link = SecureRandom.hex
  end
end
