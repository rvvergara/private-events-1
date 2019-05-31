class AddCreatorIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :creator_id, :integer, foreign_key: true
  end
end
