class AddAdditionalOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :access_control, :string
  end
end
