if [ $(hostname) = "josh-System-Product-Name" ]; then
	data_root="/mnt/hdd1/projects/BiGCN/dataset/processedV2"
	output_root="/mnt/hdd1/projects/BiGCN"
elif [ $(hostname) = "yisyuan-PC2" ]; then
	export CUDA_VISIBLE_DEVICES=0
	data_root="/home/joshchang/project/BiGCN/data/processedV2"
	output_root="/home/joshchang/project/BiGCN/results"
fi

## Train EBGCN on my RumorV2 dataset
python main_ebgcn.py --datasetname twitter15 --modelname EBGCN --edge_infer_td --edge_infer_bu --data_root "$data_root" --output_root "$output_root"
python main_ebgcn.py --datasetname twitter16 --modelname EBGCN --edge_infer_td --edge_infer_bu --data_root "$data_root" --output_root "$output_root"
python main_ebgcn.py --datasetname semeval2019 --modelname EBGCN --edge_infer_td --edge_infer_bu --data_root "$data_root" --output_root "$output_root"