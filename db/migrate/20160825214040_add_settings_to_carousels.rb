class AddSettingsToCarousels < ActiveRecord::Migration[5.0]
  def change
    change_table :carousels do |t|
      t.string :display_orientation
      t.integer :speed
    end
  end
end
