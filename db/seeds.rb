Product.delete_all
Product.create!(title: 'Book One',
  description:
    %{<p>
        Some description for book one.
      </p>},
  image_url:   'book_one.jpg',
  price: 9.50)

Product.create!(title: 'Book Two',
  description:
    %{<p>
        Some description for book two.
      </p>},
  image_url: 'book_two.jpg',
  price: 23.45)

Product.create!(title: 'Book Three',
  description:
    %{<p>
       Some description for book three.
      </p>},
  image_url: 'book_three.jpg',
  price: 12.99)

