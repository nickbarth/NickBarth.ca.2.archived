require './db/schema'

namespace :server do
  task :start do
    system "service thin start-single /etc/thin/50.116.5.201.yaml"
  end

  task :stop do
    system "service thin stop-single /etc/thin/50.116.5.201.yaml"
  end

  task :restart do
    system "service thin restart-single /etc/thin/50.116.5.201.yaml"
  end
end

namespace :db do
  desc "create an ActiveRecord migration in ./db/migrate"
  task :create_migration do
    name = ENV['NAME']
    if name.nil?
      raise "No NAME specified. Example usage: `rake db:create_migration NAME=create_users`"
    end

    migrations_dir = File.join("db", "migrate")
    version = ENV["VERSION"] || Time.now.utc.strftime("%Y%m%d%H%M%S")
    filename = "#{version}_#{name}.rb"
    migration_class = name.split("_").map(&:capitalize).join

    FileUtils.mkdir_p(migrations_dir)

    File.open(File.join(migrations_dir, filename), 'w') do |file|
      file.write <<-MIGRATION.strip_heredoc
        class #{migration_class} < ActiveRecord::Migration
          def up
          end

          def down
          end
        end
      MIGRATION
    end
  end

  desc "migrate the database (use version with VERSION=n)"
  task :migrate do
    version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
    ActiveRecord::Migrator.migrate('db/migrate', version)
  end

  desc "rolls back the migration (use steps with STEP=n)"
  task :rollback do
    step = ENV["STEP"] ? ENV["STEP"].to_i : 1
    ActiveRecord::Migrator.rollback('db/migrate', step)
  end
end
