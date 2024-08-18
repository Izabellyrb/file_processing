# frozen_string_literal: true

class FileProcess < ApplicationRecord
  # enum status: { wait: 0, sent: 2 }

  has_one_attached :xml_file
end
