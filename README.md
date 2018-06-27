# htop in a box
This is a container running [htop] inside [shellinabox].

[htop]: http://hisham.hm/htop/
[shellinabox]: https://github.com/shellinabox/shellinabox

## Usage
```bash
$ docker run \
    -p 4200:4200 \                  # shellinabox listens on 4200
    --pid-ns=host \                 # show all processes on the system
    -v /etc/passwd:/etc/passwd:ro \ # show host system user names
    -v htop-config:/data \          # persist htop configuration
    fkrull/htop-in-a-box
```
