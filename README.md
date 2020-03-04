= Local Development

- I setup my local environment with `asdf` https://asdf-vm.com/
- The `./setup.sh` script shows how to install and configure the asdf ruby plugin.
- Running `./dev.sh` will scaffold up a dev environment and serve the site a localhost:3000.

= Testing

There is a `test.sh` file that runs all the tests.  The server needs to be started with `dev.sh` (or running on localhost:3000) for it to pass.

Run unit tests by: `bundle exec rake`
Run Cypress tests by: `yarn --color=always cypress run --project ./spec --browser chrome  --config trashAssetsBeforeRuns=true,baseUrl=http://localhost:3000`

Open the interactive Cypress runner with: `yarn --color=always cypress open --project ./spec  --config trashAssetsBeforeRuns=true,baseUrl=http://localhost:3000`

= Docker Image

You need to setup `Docker` https://www.docker.com/ on your system and then run:

`docker build . -t evals`

= Deployment

- This is deployed to Heroku using Docker.  The container must be called web.

`heroku container:push -a <APP_NAME> web`
`heroku container:release -a <APP_NAME> web`