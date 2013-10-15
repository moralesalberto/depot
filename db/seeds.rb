Product.delete_all
Product.create!(title: 'Yuengling',
  description:
    %{<p>
        Since 1829, Yuengling has been offering the best beer. D. G. Yuengling & Son is the oldest operating
        brewing company in the United States, established in 1829. It is one of the largest breweries by
        volume in the country. Based on sales in 2011, Yuengling was tied with the Boston Beer Company, maker
        of Samuel Adams brands, as the largest American-owned brewery.[1] Its headquarters are in Pottsville,
        Pennsylvania.[2] Yuengling produces about 2.5 million barrels annually, operating two Pennsylvania
        facilities, and a brewery in Tampa, Florida.
      </p>},
  image_url:   'yuengling.jpg',
  price: 6.69)

Product.create!(title: 'Heineken',
  description:
    %{<p>
        Heineken Lager Beer was first brewed by Gerard Adriaan Heineken in 1873. The beer is made of purified
        water, malted barley, hops, and yeast. In 1886 H. Elion finished the development of the Heineken A-
        yeast, which is still used in the brewing process today.
      </p>},
  image_url: 'heineken.jpg',
  price: 9.45)

Product.create!(title: 'Budweiser',
  description:
    %{<p>
       Budweiser is a pale lager produced by Anheuser–Busch InBev. Introduced in 1876 by Adolphus Busch it has
       grown to become one of the highest selling beers in the United States, and is available in over 80
       markets worldwide. It is made with up to 30% rice in addition to hops and barley malt.[1] Budweiser is
       produced in various breweries located around the world. It is a filtered beer available in draught and
       packaged forms.
      </p>},
  image_url: 'budweiser.jpg',
  price: 7.99)
