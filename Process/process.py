import os
import ipdb
from Process.dataset import BiGraphDataset
cwd=os.getcwd()


################################### load tree#####################################
def loadTree(args, dataname):
    #if 'Twitter' in dataname:
    #treePath = os.path.join(cwd,'data/'+dataname+'/data.TD_RvNN.vol_5000.txt')
    treePath = "{}/{}/data.TD_RvNN.vol_5000.txt".format(args.data_root, dataname)
    print("reading twitter tree")
    treeDic = {}
    for line in open(treePath):
        # '656955120626880512	None	1	2	9	1:1 3:1 164:1 5:1 2282:1 11:1 431:1 473:1 729:1'
        #  eid, indexP, index_C, max_degree maxL Vec
        line = line.rstrip()
        eid, indexP, indexC = line.split('\t')[0], line.split('\t')[1], int(line.split('\t')[2])
        max_degree, maxL, Vec = int(line.split('\t')[3]), int(line.split('\t')[4]), line.split('\t')[5]
        if not treeDic.__contains__(eid):
            treeDic[eid] = {}
        treeDic[eid][indexC] = {'parent': indexP, 'max_degree': max_degree, 'maxL': maxL, 'vec': Vec}
    print('tree no:', len(treeDic))
    return treeDic

################################# load data ###################################
def loadData(args, dataname, treeDic, fold_x_train, fold_x_test, TDdroprate, BUdroprate):
    #data_path = os.path.join(cwd,'data', dataname + 'graph')
    data_path = "{}/{}graph".format(args.data_root, dataname)
    print()
    print("Loading train set", )
    traindata_list = BiGraphDataset(fold_x_train, treeDic,  tddroprate=TDdroprate, budroprate=BUdroprate, data_path=data_path)
    print("train no:", len(traindata_list))
    print("Loading test set", )
    testdata_list = BiGraphDataset(fold_x_test, treeDic, data_path=data_path)
    print("test no:", len(testdata_list))
    return traindata_list, testdata_list



