class AddPostedToInMessage < ActiveRecord::Migration
  def change
    add_column :in_messages, :posted_to_fb, :boolean
  end
end
