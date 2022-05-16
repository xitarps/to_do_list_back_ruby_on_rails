class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.datetime :resolving_date

      t.timestamps
    end
  end
end
