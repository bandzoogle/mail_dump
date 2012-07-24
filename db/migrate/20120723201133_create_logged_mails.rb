class CreateLoggedMails < ActiveRecord::Migration
  def change
    create_table :logged_mails do |t|
      t.string :to
      t.string :reply_to
      t.string :from
      t.string :subject
      t.text :body, :limit => 16777215
      t.text :html, :limit => 16777215

      t.timestamps
    end
  end
end
