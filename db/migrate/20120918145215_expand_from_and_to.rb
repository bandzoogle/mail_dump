class ExpandFromAndTo < ActiveRecord::Migration
  def up
    change_column :logged_mails, :to, :text, :limit => 16777215
    change_column :logged_mails, :from, :text, :limit => 16777215
    change_column :logged_mails, :reply_to, :text, :limit => 16777215
  end

  def down
    change_column :logged_mails, :to, :string
    change_column :logged_mails, :from, :string
    change_column :logged_mails, :reply_to, :string
  end
end
