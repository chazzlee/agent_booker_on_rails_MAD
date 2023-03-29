class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.string :day_of_week, null: false
      t.time :start_at, null: false
      t.time :end_until, null: false
      t.boolean :reserved, null: false, default: false
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
