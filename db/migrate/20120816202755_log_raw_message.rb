class LogRawMessage < ActiveRecord::Migration
  def change
    add_column :logged_mails, :raw, :text, :limit => 16777215
  end
end
