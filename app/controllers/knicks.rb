get '/knicks/index' do
  @knicks = Knick.order(:created_at)
  erb :'index'
end

get '/knicks/new' do
  erb :'new'
end

post '/knicks' do
  @knick = Knick.new(params[:knick])
  if @knick.save
    redirect "/knicks/#{@knick.id}"
  else
    @errors = @knick.errors.full_messages
    erb :'new'
  end
end

get '/knicks/:id' do
  @knick = Knick.find(params[:id])
  erb :'show'
end

get '/knicks/:id/edit' do
  @knick = Knick.find(params[:id])
  erb :'edit'
end

post '/knicks/:id' do
  knick = Knick.find(params[:id])
  knick.update_attributes(params[:knick])
  redirect "/knicks/#{knick.id}"
end

get '/knicks/:id/delete' do
  knick = Knick.find(params[:id])
  knick.destroy
  redirect '/knicks/index'
end


