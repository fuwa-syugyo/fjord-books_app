class AddReportIdComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :report, foreign_key: true
  end
end
