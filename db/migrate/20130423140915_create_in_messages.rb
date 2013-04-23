class CreateInMessages < ActiveRecord::Migration
  def change
    create_table :in_messages do |t|
      t.string :type
      t.string :to
      t.string :msisdn
      t.string :network_code
      t.text :message_id
      t.datetime :message_timestamp
      t.text :text
      t.boolean :concat
      t.string :concat_ref
      t.integer :concat_total
      t.integer :concat_part
      t.string :status

      t.timestamps
    end
  end
end
