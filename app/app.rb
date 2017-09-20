ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
# We're gonna need our Link model
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])  # 1. Create a link
    tag = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
    link.tags << tag  # 3. Adding the tag to the link's DataMapper collection
    link.save  # 4. Saving the link
    redirect '/links'
  end

  get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :'links/index'
end

end
