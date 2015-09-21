class Comment < Message
  ##
  # Validations
  validates :body, length: { within: 2..250 }
end
