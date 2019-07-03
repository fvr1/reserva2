# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p '==== Create one company ===='

company = Company.create({ name: 'Reservaditos', phone: '+56987621222',
  address: 'Manzano 343, Recoleta, RM, Chile', mail: 'reserva2@uc.cl',
  description: 'Una gran empresa de reservas'
})

p '==== Create user ===='

user = User.create({
  email: 'reservaditos@uc.cl',
  password: '123456',
  company: company
})


p '==== Create multiple resources ===='

r1 = Resource.create({ name: 'Florencia Vayadares', category: 'Organizer',
  details: 'The best organizer in town', company: company
})

r2 = Resource.create({ name: 'Felipe Garriding', category: 'Organizer',
  details: 'The 2nd best organizer in town', company: company
})

r3 = Resource.create({ name: 'Stephanie Chaucha', category: 'Organizer',
  details: 'The 3rd best organizer in town', company: company
})

p '==== Create multiple blocks ===='


b1 = Block.create({start_time: '2019-05-13 10:00:00', 
  end_time: '2019-05-13 11:30:00', 
  company: company,
  day: 0
})

b2 = Block.create({start_time: '2019-05-14 10:00:00', 
  end_time: '2019-05-14 11:30:00', 
  company: company,
  day: 1
})

b3 = Block.create({start_time: '2019-05-15 13:00:00', 
  end_time: '2019-05-15 15:00:00', 
  company: company,
  day: 2
})

b4 = Block.create({start_time: '2019-05-16 10:00:00', 
  end_time: '2019-05-16 10:15:00', 
  company: company,
  day: 3
})


p '==== Create multiple states ===='
s = State.create({block: b1, resource: r1, date: '2019-05-13 10:00:00', category: 0})