class ChangeTimeLeftToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :episodes, :progress, :integer
  end
end
