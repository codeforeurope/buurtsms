class CreateOutMessages < ActiveRecord::Migration
  def change
    create_table :out_messages do |t|
      t.string :from
      t.string :to
      t.string :type
      t.text :text
      t.timestamp :timestamp
      t.datetime :message_date
      t.string :message_id
      t.string :error_text
      t.string :status
      t.integer :in_message_id

      t.timestamps
    end
  end
end
