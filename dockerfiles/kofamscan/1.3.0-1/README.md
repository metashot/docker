# kofamscan

## Run KofamScan
```sh
docker run --rm -v /path/kofam_data:/kofam_data -v /path/data:/data \
    exec_annotation -p /kofam_data/profiles/prokaryote.hal -k /kofam_data/ko_list \
    -o result.txt query.fasta
```
