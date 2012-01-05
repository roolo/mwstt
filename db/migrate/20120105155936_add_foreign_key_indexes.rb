class AddForeignKeyIndexes < ActiveRecord::Migration
  def self.up
    add_index :activities, :project_id
    add_index :activities, :user_id

    add_index :datetimes, :activity_id
    add_index :datetimes, :user_id

    add_index :projects, :project_id
    add_index :projects, :user_id

    add_index :taggings, :tagger_id
    add_index :taggings, :tagger_type

    add_index :users, :locale_id
  end

  def self.down
    remove_index :activities, :project_id
    remove_index :activities, :user_id

    remove_index :datetimes, :activity_id
    remove_index :datetimes, :user_id

    remove_index :projects, :project_id
    remove_index :projects, :user_id

    remove_index :taggings, :tagger_id
    remove_index :taggings, :tagger_type

    remove_index :users, :locale_id
  end
end
