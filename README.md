# Tea Subscriptions

## Overview
- todo

## Versions

- Rails 5.2.5
- Ruby 2.5.3
- Bundler 2.1.4

## Database Schema
- todo

## API Endpoint Examples

#### Create Customer Tea Subscription

Endpoint: http://localhost:3000/api/v1/subscriptions
Verb: POST

```
Body: {
         "customer_id": 23,
         "subscription_id": 9
      }
```

Sample Data Returned

```
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "id": 4,
            "title": "Summer Mellow",
            "price": 4.99,
            "status": "true",
            "teas": [
                {
                    "id": 5,
                    "title": "Green Tea",
                    "description": "Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.",
                    "brew_time": 10.3,
                    "subscription_id": 4
                },
                {
                    "id": 6,
                    "title": "Mint Tea",
                    "description": "Mint tea is an herbal tea that is appreciated around the world for its fresh aroma and soothing taste. Mint tea benefits are widely promoted, but not all of them are supported by scientific studies. Other types of mint tea—such as Skinny Mint Tea—have become popular based, in part, on the benefits of mint tea.",
                    "brew_time": 10.3,
                    "subscription_id": 4
                }
            ]
        }
    }
}
```
