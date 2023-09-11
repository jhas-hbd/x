class ChangeDataNumberToDays < ActiveRecord::Migration[6.1]
  def change
    change_column :days, :number, :date
  end
end
