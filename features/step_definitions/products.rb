Given(/^there is an Admin user$/) do
 FactoryGirl.create(:user, :username => "myusername")
 User.count.should eq(1)
end

When(/^the Admin user visits the products page$/) do
  visit(products_path)
end
