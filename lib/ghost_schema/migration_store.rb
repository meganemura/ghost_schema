module GhostSchema
  class MigrationStore
    class << self
      attr_accessor :original_migrations_paths
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

        original_migrations_paths.flat_map do |migrations_path|
          pattern = File.join(migrations_path, '*')
          Dir.glob(pattern).select {|x| patterns.match?(x) }
        end
      end

      def diff_versions
        after_migrating_migrations - before_migrating_migrations
      end
    end
  end
end
