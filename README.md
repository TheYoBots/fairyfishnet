# Fairyfishnet - Distributed Network for [liantichess](https://liantichess.herokuapp.com/)

Based on [fairyfishnet](https://github.com/gbtami/fairyfishnet).

## How to setup

#### Linux

You need to have Fairy Stockfish for linux ready. To achieve this you can use the provided script [`build-stockfish.sh`](https://github.com/gbtami/fairyfishnet/blob/master/build-stockfish.sh). The script first clones [Fairy Stockfish github](https://github.com/ianfab/Fairy-Stockfish) and then runs the make command either with popcnt or bmi2 depending on your cpu. You can also try using the provided precompiled 'fairy-stockfish-largeboards' for intel with bmi2, if that works for you or you can [compile Fairy Stockfish seperately](https://github.com/ianfab/Fairy-Stockfish/wiki/Compiling-Fairy-Stockfish) or download Fairy Stockfish from the [latest release](https://github.com/ianfab/Fairy-Stockfish/releases).
To test that engine works on you machine just run the engine `./stockfish-x86_64-bmi2`.

```
uci
isready
```
after readyOk appears run:
`bench`
If the engine didn't crash, it probably works.

If you have Fairy Stockfish ready and python3 installed just run,
```
pip install -r requirements.txt
python3 ./fairyfishnet.py  -k fishentkey # Replace 'fishnetkey' with your Fairyfishnet key.
```
You might face some errors after running `python3 ./fairyfishnet.py  -k fishentkey`. If you do face any errors then delete the [fishnet.ini](/fishnet.ini) file and then run `python3 ./fairyfishnet.py`, it will ask you about what working directory you want to use, path to the engine and similar things, leaving everything default should be fine.

To get your Fairyfishnet key you either message SriMethan#7290 on discord or message [@SriMethan](https://lichess.org/@/SriMethan) at [lichess](https://lichess.org).

If you want to go over this setup step again, just delete the `fishnet.ini` file.

#### Windows

Fairyfishnet should works on windows the same way it does on linux, though you require make a few small changes.

Firstly, you need to get Fairy Stockfish for windows, which you will find in [Fairy Stockfish's releases](https://github.com/ianfab/Fairy-Stockfish/releases). You can also try using the provided precompiled 'stockfish-windows-amd64-bmi2.exe' for amd64 with bmi2, if that works for you or [compile Fairy Stockfish seperately](https://github.com/ianfab/Fairy-Stockfish/wiki/Compiling-Fairy-Stockfish). To test that engine works on your machine just run the engine `\stockfish-windows-amd-bmi2.exe`. 
```
uci
isready
```
after `readyOk` appears run: 
```
bench
```
If the engine didn't crash, it probably works. Make sure to add the windows version of Fairy Stockfish that you have downloaded in the fairyfishnet directory incase you have downloaded it seperately.

If you have Fairy Stockfish ready and python3 installed just run,
```
pip install -r requirements.txt
python fairyfishnet.py -k fishentkey # Replace 'fishnetkey' with your Fairyfishnet key.
```
You might face some errors after running `python ./fairyfishnet.py  -k fishentkey`. If you do face any errors then delete the [fishnet.ini](/fishnet.ini) file and then run `python ./fairyfishnet.py`, it will ask you about what working directory you want to use, path to the engine and similar things, leaving everything default should be fine.

To get your Fairyfishnet key you either message SriMethan#7290 on discord or message [@SriMethan](https://lichess.org/@/SriMethan) at [lichess](https://lichess.org).

If you want to go over this setup step again, just delete the `fishnet.ini` file.

#### Heroku

To set up Fairyfishnet in Heroku you need to have a [Heroku account](https://signup.heroku.com/login) and might need to fork or import this repository. If you have a fork of [fairyfishnet](https://github.com/gbtami/fairyfishnet) then you can simply create a new branch on your repository, add a remote to this repository and then pull the `heroku` branch as follows:

```
git checkout -b new-branch # 'new-branch' can be replaced with whatever you want to name your branch. The name doesn't really matter. This creates a new branch.
git remote add theyobots https://github.com/TheYoBots/fairyfishnet.git # This adds a remote.
git fetch theyobots master && git reset --hard theyobots/master # This pulls all the code from this repository.
git push --force origin new-branch
```

Now that you have all you need, all you need to do is create a [new app in heroku](https://dashboard.heroku.com/new-app) (the name and region don't matter), then go to the `Deploy` tab and select `GitHub` under `Deployment method` and then scroll down and click on `search` and `connect` your fork/import of fairyfishnet. Now you need to `Deploy` to the 'new-branch'/'heroku' and wait for the deployment to complete. Once it has been completed, go to the `Resources` tab and enable `worker` dynos. After that you need to go to the `Settings` tab and then scroll a bit lower and click on `Reveal Config Vars`. Under `Config Vars` you need to set `Key` to `FISHNET_KEY` and `value` to your Fairyfishnet key which you can get on discord by messaging SriMethan#7290 or by messaging [@SriMethan](https://lichess.org/@/SriMethan) at [lichess](https://lichess.org). Make sure that the key you get is kept private and not shared with anyone. Now Fairyfishnet should start running soon!

**Do note that the heroku stack must be set to `Container`. To do so you must download [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) and set stack to `Container` with `heroku stack:set container --app appname`, where `appname` is replaced with the name of your heroku app.**

## How it works

Every once in a while fairyfishnet is running on your computer asks [liantichess](https://liantichess.herokuapp.com/) for some work. If someone requested analysis of their game on [liantichess](https://liantichess.herokuapp.com/), you may receive this work. The work is a simple json containing mainly the initial position and sequence of moves. You then run engine analysis on these data and send the results back to [liantichess](https://liantichess.herokuapp.com/).
