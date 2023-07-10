class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :list, foreign_key: true
      t.string :description
      t.integer :importance

      t.timestamps
    end
  end
end
