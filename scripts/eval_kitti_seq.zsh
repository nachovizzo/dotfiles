#!/usr/bin/env zsh
# @file      eval_kitti.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh
SEQ="$@"

echo "Obtaining KITTI Odometry benchmark metrics for ${BOLD_CYAN}sequence:${SEQ}${RESET} in $(pwd)"
echo "---------------------------------------------------------------------------------------------"
for exp in *${SEQ}*.txt; do
    echo "${BOLD_YELLOW}${exp}${RESET}"
    kitti_seq_err $DATASETS/kitti-odometry/dataset/poses/${SEQ}.txt $exp | tail -n2
    echo "---------------------------------------------------------------------------------------------"
done
