rails assets:clobber RAILS_ENV=production
rails assets:precompile RAILS_ENV=production
docker rm `docker ps -aq`
docker rmi `docker images -q`
docker volume rm gnavi_public_data
docker-compose build