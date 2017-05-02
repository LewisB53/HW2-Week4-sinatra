require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/pizza.rb')

# INDEX - READ

get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

#New - CREATE

get '/pizzas/new' do
  erb(:new)
end

get 'pizzas/quantity' do

end

get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#Create _create

post '/pizzas' do
 @pizza = Pizza.new(params)
 @pizza.save
 erb(:create)
end

#Delete
post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete
  erb(:delete)
end

#EDIT

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

#UPDATE

post '/pizzas/:id' do
  @pizza = Pizza.new(params[:id])
  @pizza.update
  erb(:update)
end
