class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.index :report_id

      t.timestamps
    end
  end
end
