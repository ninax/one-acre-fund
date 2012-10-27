class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender
      t.text :recipient
      t.text :body
      t.datetime :time

      t.timestamps
    end
  end
end
