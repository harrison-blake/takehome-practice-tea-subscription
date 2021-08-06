
# Tea Subscriptions

## Technologies

- Language: Ruby <img alt="Ruby" src="https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white"/>
- Framework: Rails <img alt="Rails" src="https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>
- Testing: RSpec
- Response Caching: VCR & Webmock
- Test Coverage: SimpleCov

## Versions

- Rails 5.2.5
- Ruby 2.5.3
- Bundler 2.1.4

## Database Schema
<img width="1164" alt="Screen Shot 2021-07-28 at 9 57 36 AM" src="https://user-images.githubusercontent.com/72946334/127355925-959aed7e-c724-46d9-86cb-6b17493155f2.png">

## API Endpoint Examples

#### Subscribe Customer

Endpoint: http://localhost:3000/api/v1/customers

Verb: POST

Body:

```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "id": 1,
            "title": "Summer Mellow",
            "price": 4.99,
            "teas": [
                {
                    "id": 1,
                    "title": "Green Tea",
                    "description": "Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.",
                    "brew_time": 10.3,
                    "subscription_id": 1
                },
                {
                    "id": 2,
                    "title": "Mint Tea",
                    "description": "Mint tea is an herbal tea that is appreciated around the world for its fresh aroma and soothing taste. Mint tea benefits are widely promoted, but not all of them are supported by scientific studies. Other types of mint tea—such as Skinny Mint Tea—have become popular based, in part, on the benefits of mint tea.",
                    "brew_time": 10.3,
                    "subscription_id": 1
                }
            ]
        }
    }
}
```

#### Unsubscribe Customer

Endpoint: http://localhost:3000/api/v1/customers

Verb: PUT

Body: 

```
{
    subscription_id: @test_sub.id
}
```

Sample Data Returned:

```
204 no content http status with no body returned
```

#### Get Customer Information

Endpoint: http://localhost:3000/api/v1/customers/:id

Verb: GET

Sample Data Returned:

```
{
    "data": {
        "id": "1",
        "type": "customer",
        "attributes": {
            "id": 1,
            "first_name": "Harrison",
            "last_name": "Blake",
            "email": "test",
            "subscriptions": [
                {
                    "id": 2,
                    "title": "Winter Warmth",
                    "price": 5.99,
                    "created_at": "2021-07-28T14:51:59.886Z",
                    "updated_at": "2021-07-28T14:51:59.893Z",
                    "customer_id": 1,
                    "status": "true"
                },
                {
                    "id": 1,
                    "title": "Summer Mellow",
                    "price": 4.99,
                    "created_at": "2021-07-28T14:51:59.855Z",
                    "updated_at": "2021-07-28T14:52:57.873Z",
                    "customer_id": 1,
                    "status": "false"
                }
            ]
        }
    }
}
```

## Test Coverage

![Screen Shot 2021-07-28 at 10 22 04 AM](https://user-images.githubusercontent.com/72946334/127359744-20bbc4cd-6cc6-4741-a29e-2081c582077a.png)

