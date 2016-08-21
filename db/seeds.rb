User.delete_all
Carousel.delete_all

u = User.create(name: 'Elias Hernandis', email: 'test@me.com', password: 'helloworld', password_confirmation: 'helloworld').confirm
u.initialize_settings # TODO: shouldn't this be auto

