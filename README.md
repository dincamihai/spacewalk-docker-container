- build ```docker build . -t java-env```

- add to ~/.bashrc

```bash
function sumadebug() {
    rlwrap jdb -attach $1:8000 -sourcepath /home/mdinca/store/repositories/spacewalk/java/code/src/
}

function taskodebug() {
    rlwrap jdb -attach $1:8001 -sourcepath /home/mdinca/store/repositories/spacewalk/java/code/src/
}

function junit-tester() {
    docker run --privileged -it --rm --name junit-tester \
        --network host \
        -e SYSTEMD_NO_WRAP=1 \
        -e PG_TMPFS_DIR=/tmpfs \
        -p 5432:5432 \
        -p 8000:8000 \
        -v /home/mdinca/store/repositories/spacewalk/:/manager \
        $1 /bin/bash;
}
```

- run ```source ~/.bashrc```

- run ```junit-tester java-env```
