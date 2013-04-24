class RenameTextColumnInInMessages < ActiveRecord::Migration
  def up
    rename_column :in_messages, :text, :message_text
  end

  def down
    rename_column :in_messages, :message_text, :text
  end
end
