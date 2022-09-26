if [ $(hostname) = "josh-System-Product-Name" ]; then
	export CUDA_VISIBLE_DEVICES=0
	data_root="/mnt/hdd1/projects/BiGCN/dataset/processedV2"
	output_root="/mnt/hdd1/projects/EBGCN"
elif [ $(hostname) = "yisyuan-PC2" ]; then
	export CUDA_VISIBLE_DEVICES=0
	data_root="/home/joshchang/project/BiGCN/data/processedV2"
	output_root="/home/joshchang/project/EBGCN/results"
fi

## Train EBGCN on my RumorV2 dataset
python main_ebgcn.py --modelname EBGCN --edge_loss_td 0.4 --edge_loss_bu 0.4 --edge_num 2 --data_root "$data_root" --output_root "$output_root" --datasetname twitter15
python main_ebgcn.py --modelname EBGCN --edge_loss_td 0.3 --edge_loss_bu 0.3 --edge_num 3 --data_root "$data_root" --output_root "$output_root" --datasetname twitter16
python main_ebgcn.py --modelname EBGCN --edge_loss_td 0.3 --edge_loss_bu 0.3 --edge_num 4 --data_root "$data_root" --output_root "$output_root" --datasetname semeval2019