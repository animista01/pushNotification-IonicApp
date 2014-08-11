class CreatePushSenders < ActiveRecord::Migration
  def change
    create_table :push_senders do |t|
      t.text :text
      t.string :url

      t.timestamps
    end
  end
end
