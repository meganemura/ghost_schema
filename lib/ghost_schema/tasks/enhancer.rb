module GhostSchema
  module Tasks
    module Enhancer
      extend self

      def enhance
        task = Rake::Task['db:migrate']
        task.enhance(['db:ghost:store_versions_before_migrations'])
        task.enhance do
          Rake::Task['db:ghost:copy_migrated_versions'].invoke
        end
      end
    end
  end
end
