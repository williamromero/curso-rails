# == Schema Information
#
# Table name: credit_cards
#
#  id              :bigint           not null, primary key
#  expiration_date :string(255)      default("")
#  no_card         :string(255)      default("")
#  owner           :string(255)
#  provider        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class CreditCard < ApplicationRecord
end
