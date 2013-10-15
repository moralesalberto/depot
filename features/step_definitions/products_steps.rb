Given(/^there is an Admin user$/) do
 FactoryGirl.create(:user, :username => "myusername")
 User.count.should eq(1)
end

When(/^the Admin user visits the products page$/) do
  visit(products_path)
end

Then(/^a list of products should be shown, each with a link to View the product detail$/) do
  FactoryGirl.create(:product, :title => 'How to write the Depot app with Cucumber and HAML')
  Product.count.should eq(1)
  visit(products_path)
  page.should have_content('How to write the Depot app with Cucumber and HAML')
  product = Product.first
  page.html.should =~ /#{product_path(product)}/
end

Then(/^a link to Add a New Product should also be shown$/) do
  visit(products_path)
  page.html.should =~ /#{new_product_path}/
end

When(/^the Admin visits the new products page$/) do
  visit(new_product_path)
end

Then(/^the New Product form should be shown$/) do
  page.html.should have_selector(:xpath, '//form[@action="/products"]')
  page.html.should have_selector(:xpath, '//form[@method="post"]')
  page.html.should have_selector(:xpath, '//input[@id="product_title"]')
  page.html.should have_selector(:xpath, '//textarea[@id="product_description"]')
  page.html.should have_selector(:xpath, '//input[@id="product_price"]')
end

When(/^the admin fills out the New Product form field$/) do
  fill_in('product_title', :with => 'Coors') 
  fill_in('product_description', :with => 'The beer of the Rockies')
  fill_in('product_price', :with => '12.35')
end

And(/^submits the new product form$/) do
  click_on('Create Product')
end

Then(/^a new product should be created$/) do
  products = Product.where(:title => 'Coors').to_a
  products.size.should eq(1)
end

Then(/^a success page should be shown with the newly created product$/) do
  page.should have_content('Coors')
  page.should have_content('The beer of the Rockies')
  page.should have_content('12.35')
end




