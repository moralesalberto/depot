

Given(/^there is a Product$/) do
  @product = FactoryGirl.create(:product, :title => "Blue Moon", :price => "12.99")
  Product.count.should eq(1)
end

When(/^the Admin goes to the edit page for the product$/) do
  visit(edit_product_path(@product))
end

Then(/^the Edit Product form should be shown$/) do
  page.html.should have_selector(:xpath, '//input[@name="_method" and @value="patch"]')
  page.html.should have_selector(:xpath, '//form[starts-with(@action, "/products/")]')
  page.html.should have_selector(:xpath, '//input[@name="product[price]" and @value="12.99"]')
  page.html.should have_selector(:xpath, '//input[@name="product[title]" and @value="Blue Moon"]')
end

When(/^the Admin completes editing the fields on the Edit Product form$/) do
  fill_in('product_price', :with => '13.13')
end

When(/^submits the Edit Product form$/) do
  click_on('Update Product')
end

Then(/^the changes for the product should be saved$/) do
  saved_product = Product.find(@product.id)
  saved_product.price.to_s.should eq('13.13')
end

Then(/^a success page should be shown with the product that was just edited$/) do
  page.should have_content('Blue Moon')
  page.should have_content('13.13')
end

