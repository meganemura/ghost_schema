require "ghost_schema/railtie"
require "ghost_schema/migration_store"
require "ghost_schema/tasks/enhancer"
require "ghost_schema/version"

module GhostSchema
  def self.migrations_path
    Rails.root.join('tmp', 'schema_ghosts')
  end
end
