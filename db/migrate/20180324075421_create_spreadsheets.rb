class CreateSpreadsheets < ActiveRecord::Migration[5.1]
  def change
    create_table :spreadsheets do |t|
      t.string :spreadsheet_id
      t.string :tab_id
      t.string :tab_name
      t.string :range
      t.string :link_name


      t.timestamps
    end
  end
end
