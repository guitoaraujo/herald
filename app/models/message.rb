# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  enum status: %i[hidden visible]
end
