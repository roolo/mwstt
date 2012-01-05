class ProjectActivityBelongsToUser < ActiveRecord::Migration
  def self.up
    say_with_time("Create foreign key columns") do
      change_table :activities do |t|
        t.references  :user
      end

      change_table :projects do |t|
        t.references  :user
      end
    end

    say_with_time("Recreate data for existing records. user_id will be taken from datetimes, which allready belongs to user") do
      Activity.connection.execute("
        UPDATE  activities
        SET     user_id = (
          SELECT  d.user_id
          FROM    datetimes d
            INNER JOIN activities a ON a.id = d.activity_id AND a.id = activities.id
          LIMIT 1
        )
      ")

      Project.connection.execute("
        UPDATE  projects
        SET     user_id = (
          SELECT  d.user_id
          FROM    datetimes d
            INNER JOIN activities a ON a.id = d.activity_id
            INNER JOIN projects p   ON p.id = a.project_id AND p.id = projects.id
          LIMIT 1
        )
      ")

    end
  end

  def self.down
    remove_column :activities, :user_id
    remove_column :projects, :user_id
  end
end
