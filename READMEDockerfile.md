

Now, `docker image ls` returns
```
ubuntu              20.04               f63181f19b2f        5 weeks ago         72.9MB
```

Next: `sudo docker run --rm -v $(pwd):/usr/project f63181f19b2f`

`--rm` :		Automatically remove the container when it exits
`--interactive , -i`	Keep STDIN open even if not attached
