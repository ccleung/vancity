# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'Creating admin... ' << user.email

location = Location.find_or_create_by(city: 'Toronto', region: 'ON', country: 'Canada')

puts 'Creating location... ' << location.city

location = Location.find_or_create_by(city: 'Toronto', region: 'ON', country: 'Canada')

root_category_names = ['goods', 'services']

#services = Category.find_or_create_by(name: 'Services')
#goods = Category.find_or_create_by(name: 'Goods')

sub_category_names = {
	root_category_names[0] => ['books', 'computers', 'electronics', 'furniture', 'other'],
	root_category_names[1] => ['photographer', 'ux designer', 'software developer', 'DJ', 'videographer', 'other']
}

root_categories = []

for root_category_name in root_category_names
	root_category = Category.create(name:root_category_name)
	puts 'Creating root category... ' + root_category.name + ' ' + root_category.id.to_s
	root_categories << root_category
end

for root_category in root_categories
	for sub_category_name in sub_category_names[root_category.name]
		sub_category = Category.new({:name => sub_category_name})
		puts 'Creating sub category... ' + sub_category.name + ' ' + sub_category.id.to_s
		root_category.categories << sub_category
	end
	puts 'ATTEMPING TO SAVE'
	if root_category.save
		puts 'Save success!'
	else
		puts 'Save failed!'
	end
end 




