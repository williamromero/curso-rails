class PasswordValidator < ActiveModel::Validator
  def validate(record)
    password_complexity(record)
    password_size(record)
  end

  def password_complexity(record)
    if record.password.present? && !record.password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)/)
      record.errors.add :password,
                        'must include at least one lowercase letter, one uppercase letter, one digit, and one special character'
    end
  end

  def password_size(record)
    if record.password.present? && record.password.length < 6
      record.errors.add :password,
                        'must be at least 6 characters'
    end
  end
end
