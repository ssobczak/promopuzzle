class AddPartOwner < ActiveRecord::Migration
  def change
 		add_column :parts, :user_id, :integer
  end
end
