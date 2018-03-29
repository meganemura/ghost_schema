module GhostSchema
  class Railtie < ::Rails::Railtie
    rake_tasks do
      Tasks::Enhancer.enhance
      load 'tasks/ghost_schema_tasks.rake'
    end
  end
end
