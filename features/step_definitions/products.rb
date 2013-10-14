Given(/^there is an Admin user$/) do
  FactoryGirl.create(:user, :username => "myusername")
  User.count.should eq(1)
end
