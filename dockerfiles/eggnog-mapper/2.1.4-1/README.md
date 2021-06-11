# eggnog-mapper

## Fetch eggNOG databases (PFAM and MMseqs2 databases included)

```sh
docker run --rm -v /path/eggnog_data:/eggnog_data metashot/eggnog-mapper \
    download_eggnog_data.py -M -P -y --data_dir /eggnog_data
```

## Run eggNOG-mapper (metagenome example)
```sh
docker run --rm -v /path/eggnog_data:/eggnog_data -v /path/data:/data metashot/eggnog-mapper \
    emapper.py -i /data/seq.fa -o /data/seq_out -m mmseqs --itype metagenome \
    --data_dir /eggnog_data
```
