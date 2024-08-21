# frozen_string_literal: true

class FileProcess < ApplicationRecord
  # enum status: { waiting: 0, sent: 2 }

  has_one_attached :xml_file

  def parsed_xml
    Nokogiri::XML(self.file_data)
  end
end
