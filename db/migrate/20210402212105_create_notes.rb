class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :name
      t.string :color
      t.string :icon
      t.text :description

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
