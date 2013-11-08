# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

City.create( :coordinate_x => 2, :coordinate_y => 1, :display_name => 'Floranas')
City.create( :coordinate_x => 19, :coordinate_y => 8, :display_name => 'Botrina')
City.create( :coordinate_x => 10, :coordinate_y => 15, :display_name => 'Hellanos')
City.create( :coordinate_x => 11, :coordinate_y => 18, :display_name => 'Kameela')
City.create( :coordinate_x => 9, :coordinate_y => 4, :display_name => 'Frantuk')
City.create( :coordinate_x => 18, :coordinate_y => 3, :display_name => 'Ceeya')
City.create( :coordinate_x => 4, :coordinate_y => 20, :display_name => 'Miskrit')
City.create( :coordinate_x => 1, :coordinate_y => 14, :display_name => 'Solaran')
City.create( :coordinate_x => 17, :coordinate_y => 10, :display_name => 'Magaroth')
City.create( :coordinate_x => 8, :coordinate_y => 19, :display_name => 'Hellsnow')
City.create( :coordinate_x => 12, :coordinate_y => 5, :display_name => 'River Ash')
City.create( :coordinate_x => 20, :coordinate_y => 2, :display_name => 'Pinaris')
City.create( :coordinate_x => 3, :coordinate_y => 6, :display_name => 'Elastraf')
City.create( :coordinate_x => 7, :coordinate_y => 11, :display_name => 'Yarrow')
City.create( :coordinate_x => 13, :coordinate_y => 16, :display_name => 'Crator')
City.create( :coordinate_x => 6, :coordinate_y => 7, :display_name => 'Caltanis')
City.create( :coordinate_x => 14, :coordinate_y => 17, :display_name => 'Farraw')
City.create( :coordinate_x => 5, :coordinate_y => 12, :display_name => 'Croseph')
City.create( :coordinate_x => 16, :coordinate_y => 9, :display_name => 'Garathorn')
City.create( :coordinate_x => 15, :coordinate_y => 13, :display_name => 'Plankit')

5.times do
  Complex.create
  end


User.create( :display_name => 'Taylor', :email => 'taylor.eichhorst@gmail.com', :password => 'testing', :password_confirmation => 'testing', :admin => true)

User.create( :display_name => 'Tester', :email => 'tester@gmail.com', :password => 'testing', :password_confirmation => 'testing')

User.create( :display_name => 'Other Guy', :email => 'otherguy@gmail.com', :password => 'testing', :password_confirmation => 'testing')









