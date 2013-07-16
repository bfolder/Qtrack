class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.text :content
      t.integer :priority
      t.boolean :is_resolved
      t.belongs_to :project
      t.belongs_to :user
      t.timestamps
    end
  end
end
