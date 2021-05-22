class CreatePollItems < ActiveRecord::Migration[6.1]
  def change
    create_table :poll_items do |t|
      t.string :name
      t.text :description
      t.belongs_to :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
