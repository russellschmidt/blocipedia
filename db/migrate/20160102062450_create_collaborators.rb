class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :user_id, index: true, unique: true
      t.integer :wiki_id, index: true, unique: true
      t.integer :collaborator_id, index: true, unique: true
      t.timestamps null: false
    end

  end
end
