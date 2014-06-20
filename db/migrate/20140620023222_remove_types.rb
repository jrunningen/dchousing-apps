class RemoveTypes < ActiveRecord::Migration
  def change
    remove_column :addresses, :type
    remove_column :people, :type
  end
end
