# DevTest Project

## Usage

### Rails defaults

- setup: `bin/setup`
- running: `bin/rails s`
- tests: `bin/rails test`

### API

Private API responding to the following requests:

1 - GET locations/:country_code

```sh
curl -vvv  http://localhost:3000/api/v1/protected/locations/UK.json -H 'Authorization: Token token="ebe85a907656355d84073efd5a594b18"'
```

2 - GET target_groups/:country_code

```sh
curl -vvv  http://localhost:3000/api/v1/protected/target_groups/UK.json -H 'Authorization: Token token="ebe85a907656355d84073efd5a594b18"'
```

3 - POST evaluate_target

```sh
curl -vvv  http://localhost:3000/api/v1/protected/evaluate_target.json -d "country_code=PL&target_group_id=12&locations[][id]=123&locations[][panel_size]=200 }] }" -X POST -H 'Authorization: Token token="ebe85a907656355d84073efd5a594b18"'
```

Public API responding to the following requests

4 - GET locations/:country_code

```bash
curl -vvv  http://localhost:3000/api/v1/locations/UK.json
```

5 - GET target_groups/:country_code

```
curl -vvv  http://localhost:3000/api/v1/target_groups/UK.json
```

## TODO

- rebuild database schema for target groupt tree. Use nested set?
- filter results for target group children by panel provider
- write specs
- refactor PriceLogic to be more SOLID