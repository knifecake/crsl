class CreatePosters < ActiveRecord::Migration[5.0]
  def change
    create_table :posters do |t|
      t.string :title
      t.references :carousel, foreign_key: true
      t.attachment :background

      t.timestamps
    end
  end
end
