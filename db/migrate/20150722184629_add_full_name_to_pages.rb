class AddFullNameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :full_name, :string
  end
end
