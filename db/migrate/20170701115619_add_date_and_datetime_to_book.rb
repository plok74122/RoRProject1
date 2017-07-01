class AddDateAndDatetimeToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :publish_date, :date
    add_column :books, :onBoard_datetime, :datetime
  end
end
