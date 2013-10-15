

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
