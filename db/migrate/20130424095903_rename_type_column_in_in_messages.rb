class RenameTypeColumnInInMessages < ActiveRecord::Migration
  def up
    rename_column :in_messages, :type, :message_type
  end

  def down
    rename_column :in_messages, :message_type, :type
  end
end
