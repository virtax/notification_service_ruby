class Message < ApplicationRecord
  serialize :recipients, Array
end
