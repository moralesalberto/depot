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


