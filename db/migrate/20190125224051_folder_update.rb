class FolderUpdate < ActiveRecord::Migration[5.2]
  def up
    drop_table('Folders')
    create_table('Folders') do |t|
        t.string :name
        t.integer :note_id
        t.timestamps
    end
    add_column('Notes', 'folder_id', :integer)
    add_index('Notes', ['folder_id'])
  end
  
  def down
    remove_index('Notes', ['folder_id'])
    remove_column('Notes', 'folder_id')
    drop_table('Folders')
  end
end
