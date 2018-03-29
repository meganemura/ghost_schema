# GhostSchema

**DO NOT USE THIS GEM IN PRODUCTION.**

This gem is intended to be used under development environment.

## Installation

```ruby
gem 'ghost_schema'
```

## Usage

Switching between development branches may causes you following errors.

```console
$ bin/rails db:migrate:status

database: xxx_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20171019092851  Init schema
(snip)
   up     20180319070119  Remove columns
   up     20180330010101  ********** NO FILE **********

$ bin/rails db:rollback VERSION=20180330010101
rails aborted!
ActiveRecord::UnknownMigrationVersionError:

No migration with version number 20180330010101.
```

This gem copies migration files when you run db:migrate.
If you want to run db:migrate:down for missing migration file,
you can do by running db:ghost:migrate:down.

```console
$ bin/rails db:ghost:migrate:down VERSION=20180330010101
== 20180330010101 AddAwesomeColumns: reverting ==============
(snip)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meganemura/ghost_schema.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
