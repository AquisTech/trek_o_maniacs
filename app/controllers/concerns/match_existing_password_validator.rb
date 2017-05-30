class MatchExistingPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    password = record.password
    record.password = record.current_password
    unless record.valid_password?(value)
      record.errors[attribute] << (options[:message] || 'does not match existing password')
    else
      record.password = password
    end
  end
end
