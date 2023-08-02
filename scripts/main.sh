export CUDA_VISIBLE_DEVICES=1
data_root="/mnt/1T/projects/BiGCN/dataset/processedV2"
output_root="/mnt/1T/projects/EBGCN"

## Train EBGCN on my RumorV2 dataset
python main_ebgcn.py --modelname EBGCN --edge_loss_td 0.4 --edge_loss_bu 0.4 --edge_num 2 --data_root "$data_root" --output_root "$output_root" --datasetname twitter15
python main_ebgcn.py --modelname EBGCN --edge_loss_td 0.3 --edge_loss_bu 0.3 --edge_num 3 --data_root "$data_root" --output_root "$output_root" --datasetname twitter16
python main_ebgcn.py --modelname EBGCN --edge_loss_td 0.3 --edge_loss_bu 0.3 --edge_num 4 --data_root "$data_root" --output_root "$output_root" --datasetname semeval2019
