class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :collaborators, :collaborator_id, :id
  end
end
