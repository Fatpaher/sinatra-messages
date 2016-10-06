class Message < Sequel::Model
  plugin :validation_helpers
  attr_encrypted(
    :text,
    key: SECRET_KEY,
    algorithm: 'aes-256-gcm',
    unless: proc { |message| message.password }
  )

  def validate
    super
    if option_value && option_value < 0
      errors.add(:name, "can't be negative or zero")
    end
  end

  def before_create
    super
    self.link = SecureRandom.hex
    self.option_value ||= 1
  end
end
