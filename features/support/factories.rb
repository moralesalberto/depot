FactoryGirl.define do
  factory :user do |f|
    f.username "username_here"
  end

  factory :product do |f|
    f.description "some description"
    f.title "some title"
    f.price "10.39"
    f.image_url "no_image.jpg"
  end
end
