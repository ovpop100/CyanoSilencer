ls -1 pssm_files/ |awk '{print "python ~/Software/SPIDER2_local/misc/pred_pssm.py pssm_files/"$1}' |sh
