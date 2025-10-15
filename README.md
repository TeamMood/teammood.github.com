
# Docker

## Build the image

rm Gemfile.lock 
mv dockerfile.build dockerfile
docker build -t jekyll-site-blog .

## Run the image with

docker run -d -p 4000:4000 -v "$PWD":/usr/src/app jekyll-site-blog

and go to localhost:4000

Stop the container in Docker when done.