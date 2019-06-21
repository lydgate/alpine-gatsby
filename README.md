# What is this?

It's just a Dockerfile that uses another Docker image of Alpine Linux with Node to install GatsbyJS.

# How to build

Run `docker build .` in the directory :)
Or you can run `docker build -t $USER/alpine-gatsby .` to name it after yourself.

If you want surge.sh, you can uncomment that line first.
It's a pretty crazy shell script that just blats your directory onto the internet.
For example you could run it from your Gatsby "public" directory to serve your site.

# Example run

This will run gatsby develop, putting the current directory into `/sites`, and presenting a sane gitconfig to the box.
Note that `gatsby develop` requires that `--host=0.0.0.0` to serve things out of Docker:

`
docker run --rm -p 8080:8080 -v $(pwd):/sites -v ~/.gitconfig:/etc/gitconfig $USER/alpine-gatsby gatsby develop --host=0.0.0.0
`

You can also just run it in interactive mode by omitting the end and adding `-it`:

`
docker run --rm -it -p 8080:8080 -v $(pwd):/sites -v ~/.gitconfig:/etc/gitconfig $USER/alpine-gatsby
`

The `--rm` means it will remove the container once it's done running.
