# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p '==== Create one company ===='

companies = Company.create({ name: 'Reservaditos', phone: '+56987621222',
  address: 'Manzano 343, Recoleta, RM, Chile', mail: 'reserva2@uc.cl',
  description: 'Una gran empresa de reservas'
})


p '==== Create multiple resources ===='

Resource.create({ name: 'Florencia Vayadares', category: 'Organizer',
  details: 'The best organizer in town', company: companies
})

Resource.create({ name: 'Felipe Garriding', category: 'Organizer',
  details: 'The 2nd best organizer in town', company: companies
})

Resource.create({ name: 'Stephanie Chaucha', category: 'Organizer',
  details: 'The 3rd best organizer in town', company: companies
})