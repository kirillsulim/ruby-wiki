class AddAncestryToPages < ActiveRecord::Migration
  def change
    add_column :pages, :ancestry, :string
  end
end
