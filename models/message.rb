class Message < Sequel::Model
  def validate
    errors.add(:name, "can't be empty") if text.nil? || text.empty?
  end
end
