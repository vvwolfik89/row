# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Added by Refinery CMS Employees extension
Refinery::Employees::Engine.load_seed

# Added by Refinery CMS Items extension
Refinery::Items::Engine.load_seed

# Added by Refinery CMS Departments extension
Refinery::Departments::Engine.load_seed

# Added by Refinery CMS Partners extension
Refinery::Partners::Engine.load_seed

# Added by Refinery CMS SportRowings extension
Refinery::SportRowings::Engine.load_seed

# Added by Refinery CMS Athletes extension
Refinery::Athletes::Engine.load_seed

# Added by Refinery CMS Coaches extension
Refinery::Coaches::Engine.load_seed

# Added by Refinery CMS PhotoGallery engine
Refinery::PhotoGallery::Engine.load_seed

# Added by Refinery CMS Previews extension
Refinery::Previews::Engine.load_seed

# Added by Refinery CMS Services extension
Refinery::Services::Engine.load_seed

# Added by Refinery CMS Competitions extension
Refinery::Competitions::Engine.load_seed
