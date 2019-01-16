class CreateNotes < ActiveRecord::Migration[5.2]
  def up
    create_table('Notes') do |t|
        t.string :title
        t.string :content
        t.timestamps
    end
  end
  
  def down
    drop_table('Notes')
  end
end
