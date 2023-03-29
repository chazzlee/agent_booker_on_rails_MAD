class CreateTimezones < ActiveRecord::Migration[7.0]
  def change
    create_table :timezones do |t|
      t.string :full_name
      t.string :short_name
      t.string :offset
      t.timestamps
    end
  end
end
