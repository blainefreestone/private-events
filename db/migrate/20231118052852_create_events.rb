class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date_and_time
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
