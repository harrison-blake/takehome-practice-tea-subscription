Tea.destroy_all
Subscription.destroy_all
Customer.destroy_all


@customer = Customer.create(first_name: 'Harrison', last_name: 'Blake', email: 'test')

@sub1 = Subscription.create!(title: 'Summer Mellow', price: 4.99, status: false)
@sub1.teas.create!(title: 'Green Tea', description: 'Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', brew_time: 10.30)
@sub1.teas.create!(title: 'Mint Tea', description: 'Mint tea is an herbal tea that is appreciated around the world for its fresh aroma and soothing taste. Mint tea benefits are widely promoted, but not all of them are supported by scientific studies. Other types of mint tea—such as Skinny Mint Tea—have become popular based, in part, on the benefits of mint tea.', brew_time: 10.30)

@sub2 = Subscription.create!(title: 'Winter Warmth', price: 5.99, status: true)
@sub2.teas.create!(title: 'Hibiscus Tea', description: "Fruity goodness")
@sub2.teas.create!(title: 'Lemon Tea', description: "Citris flavors for a relaxing warming effect on a nice, cold, winter day")

@customer.subscriptions << @sub2
