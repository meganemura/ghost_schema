module GhostSchema
  class MigrationStore
    class << self
      attr_accessor :before_migrating_migrations
      attr_accessor :after_migrating_migrations

      def copy_files
        copy_target_files.each do |file|
          FileUtils.copy(file, GhostSchema.migrations_path)
        end
      end

      private

      def copy_target_files
        patterns = /#{diff_versions.join('|')}/

        # TODO: rails may have an API
        migrations_paths = [Rails.root.join('db', 'migrate', '*')]

        migrations_paths.flat_map do |migrations_path|
          Dir.glob(migrations_path).select {|x| patterns.match?(x) }
        end
      end

      def diff_versions
        after_migrating_migrations - before_migrating_migrations
      end
    end
  end
end
