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

#### Subscribe Customer

Endpoint: http://localhost:3000/api/v1/customers

Verb: POST

```
Body: {
         "customer_id": 4,
         "subscription_id": 4
      }
```

Sample Data Returned:

```
{
    "data": {
        "id": "4",
        "type": "customer",
        "attributes": {
            "id": 4,
            "first_name": "Harrison",
            "last_name": "Blake",
            "email": "test",
            "subscriptions": [
                {
                    "status": "true",
                    "customer_id": 4,
                    "id": 4,
                    "title": "Summer Mellow",
                    "price": 4.99,
                    "created_at": "2021-07-28T12:23:14.575Z",
                    "updated_at": "2021-07-28T14:43:41.356Z"
                }
            ]
        }
    }
}
```

#### Unsubscribe Customer

Endpoint: http://localhost:3000/api/v1/customers

Verb: PUT

```
{
    "data": {
        "id": "4",
        "type": "customer",
        "attributes": {
            "id": 4,
            "first_name": "Harrison",
            "last_name": "Blake",
            "email": "test",
            "subscriptions": [
                {
                    "id": 4,
                    "title": "Summer Mellow",
                    "price": 4.99,
                    "created_at": "2021-07-28T12:23:14.575Z",
                    "updated_at": "2021-07-28T14:47:01.179Z",
                    "customer_id": 4,
                    "status": "false"
                }
            ]
        }
    }
}
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
