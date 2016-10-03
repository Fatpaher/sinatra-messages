class Message < Sequel::Model
  def validate
    super
    errors.add(:name, "can't be empty") if text && text&.empty?
  end

  def before_save
    super
    self.link = SecureRandom.hex
  end
end
