require 'populator'
require 'faker'

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'rubygems'

require(File.join(File.dirname(__FILE__), '../../config/environment.rb'))

namespace :populate do
   desc "Add test data"
   task(:posts) do
     Property.populate(10) do |property|
       property.title = Faker::Lorem.sentence(1)
     end
     AssetGroup.populate(10) do |asset_group|
       asset_group.title = Faker::Name.last_name
     end
     Page.populate(5) do |page|
       page.title = Faker::Lorem.sentence
       page.slug = Faker::Name.first_name
       page.body = Faker::Lorem.paragraphs(5)
       page.status = rand(1)
       page.parent_id = 0
     end
     
     Item.populate(1000) do |item|
       item.title = Faker::Name.first_name + ' ' + Faker::Name.last_name
       item.price = rand(1000)
       item.description = Faker::Lorem.paragraphs(3)
       #item.image = nil       
     end
     
     ItemProperty.populate(10000) do |item_properties|
        item_properties.property_id = rand(10)
        item_properties.value = Faker::Lorem.sentence(1)
        item_properties.item_id = rand(1000)
      end
      
     Post.populate(1000) do |post|
       post.title = Faker::Name.first_name # генерирует Имя
       post.announce = Faker::Lorem.sentence
       post.body = Faker::Lorem.paragraphs(10)
=begin
       user.last_name = Faker::Name.last_name   # Фамилию
       user.email = Faker::Internet.email       # мыло
       user.login = Faker::Internet.user_name   # логин
       user.phone = Faker::PhoneNumber.phone_number # номер телефона
       user.about = Faker::Lorem.paragraphs( 5 ) # О себе – 5 параграфов
=end
     end
  end
end