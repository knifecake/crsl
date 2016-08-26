class AddOrderToPosters < ActiveRecord::Migration[5.0]
  def change
    add_column :posters, :order, :integer
  end
end
