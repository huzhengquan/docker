docker run \
  -p 9200:9200 -p 9300:9300 \
  -v /Users/huzhengquan/work-data/esdata:/usr/share/elasticsearch/data \
  --name elasticsearch \
  -d huzhengquan/elasticsearch-ik:5 

