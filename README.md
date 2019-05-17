## Virtual Cheque Creator

This is a simple program that allows you create a virtual cheque by adding a recipient's name, date and amount.

The program runs on Ruby version 2.5.1

The program assumes you have `chromedriver` installed in order to run js tests.

To set up locally, you have to do the following:

1. run `git clone https://github.com/arisah-ijeoma/virtual_cheque_creator.git`
2. run `cd virtual_cheque_creator`
1. run `bundle`
1. run `rails db:create db:migrate`
1. run `rspec`. Your tests should all be green.
1. run `rails s` and open the program on [http://localhost:3000](http://localhost:3000)

### Limitations

Due to the time constraint, there are a few features I would have liked to add/fixed but could not. These include:

1. Pagination of the virtual cheque list
1. Buggy materialize datepicker
1. Prettifying errors on form
1. Validation on date. I understand cheques can be antedated but there is a limit on the timeframe.
1. User authentication and authorization
1. A fully responsive UI
1. Smoother transitions in the UX
