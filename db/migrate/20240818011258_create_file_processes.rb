class CreateFileProcesses < ActiveRecord::Migration[7.1]
  def change
    create_table :file_processes do |t|
      t.string  :file_data
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
