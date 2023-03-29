class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :name, null: false
      t.references :timezone, null: false
      t.timestamps
    end
  end
end
