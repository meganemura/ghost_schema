namespace :db do
  namespace :ghost do
    namespace :migrate do
      desc 'Runs the "down" for a given migration VERSION from tmp/schema_ghosts.'
      task down: [:prepare_directory, 'db:load_config'] do
        ActiveRecord::Tasks::DatabaseTasks.migrations_paths = [Rails.root.join('tmp', 'schema_ghosts')]
        ActiveRecord::Migrator.migrations_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths
        Rake::Task['db:migrate:down'].invoke
      end

      task :prepare_directory do
        FileUtils.mkdir_p(Rails.root.join('tmp', 'schema_ghosts'))
      end
    end
  end
end
