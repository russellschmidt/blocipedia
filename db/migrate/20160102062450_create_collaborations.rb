class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :wiki_id, index: true
      t.integer :collaborator_id, index: true
      t.timestamps null: false
    end

  end
end
