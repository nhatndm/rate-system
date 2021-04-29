class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.integer :point
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
