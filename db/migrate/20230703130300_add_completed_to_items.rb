class AddCompletedToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :completed, :boolean
  end
end
