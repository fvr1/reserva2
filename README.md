# Reserva2

### Initialize app
```md
docker-compose build
docker-compose -f docker-compose.yml up -d
docker-compose exec web rails db:setup
```

### Run app
```md
docker-compose -f docker-compose.yml up -d
```

### Stop app
```md
docker-compose -f docker-compose.yml stop
```

### Delete app
```md
docker-compose -f docker-compose.yml down
```
