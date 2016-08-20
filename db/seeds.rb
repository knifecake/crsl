User.delete_all
Carousel.delete_all

User.create(name: 'Elias Hernandis', email: 'test@me.com', password: 'helloworld', password_confirmation: 'helloworld').confirm
