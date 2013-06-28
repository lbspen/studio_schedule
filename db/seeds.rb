# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

studio_assets = StudioAsset.create([
        { name: 'piano', base_cost: 50},
        { name: 'tune', base_cost: 50},
        { name: 'credit card', base_cost: 50},
        { name: 'tracking', base_cost: 50},
        { name: 'overdubs', base_cost: 50},
        { name: 'editing', base_cost: 50},
        { name: 'mixing', base_cost: 50},
        { name: 'mastering', base_cost: 50},
        { name: 'production', base_cost: 50},
        { name: 'post production', base_cost: 50},
        { name: 'instrumentation', base_cost: 50},
        { name: 'other', base_cost: 0}

    ])

