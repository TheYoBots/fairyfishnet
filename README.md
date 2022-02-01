# Fairyfishnet Heroku
A way to setup fairyfishnet on heroku for Liantichess.

To set up Fairyfishnet in Heroku you need to have a [Heroku account](https://signup.heroku.com/login) and might need to fork or import this repository. If you have a fork of [fairyfishnet](https://github.com/gbtami/fairyfishnet) then you can simply create a new branch on your repository, add a remote to this repository and then pull the `heroku` branch as follows:

```
git checkout -b new-branch # 'new-branch' can be replaced with whatever you want to name your branch. The name doesn't really matter. This creates a new branch.
git remote add theyobots https://github.com/TheYoBots/fairyfishnet.git # This adds a remote.
git fetch theyobots master && git reset --hard theyobots/master # This pulls all the code from this repository.
git push --force origin new-branch
```

Now that you have all you need, all you need to do is create a [new app in heroku](https://dashboard.heroku.com/new-app) (the name and region don't matter), then go to the `Deploy` tab and select `GitHub` under `Deployment method` and then scroll down and click on `search` and `connect` your fork/import of fairyfishnet. Now you need to `Deploy` to the 'new-branch'/'heroku' and wait for the deployment to complete. Once it has been completed, go to the `Resources` tab and enable `worker` dynos and shoginet should start running soon!

**Do note that the heroku stack must be set to `Container`. To do so you must download [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) and set stack to `Container` with `heroku stack:set container --app appname`, where `appname` is replaced with the name of your heroku app.**