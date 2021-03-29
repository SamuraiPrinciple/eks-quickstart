#!/bin/bash

cp ../cluster-bootstrap/eks_cluster.py ./source
sed -i "s#create_new_cluster_admin_role = True#create_new_cluster_admin_role = False#" source/eks_cluster.py
sed -i 's#existing_role_arn="arn:aws:iam::123456789123:role/RoleName"#existing_role_arn=core.Fn.join("",["arn:aws:sts::",core.Fn.ref("AWS::AccountId"),":assumed-role/TeamRole/MasterKey"])}#' source/eks_cluster.py