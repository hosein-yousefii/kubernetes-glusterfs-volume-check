# kubernetes-glusterfs-volume-check

[![GitHub license](https://img.shields.io/github/license/hosein-yousefii/kubernetes-glusterfs-volume-check)](https://github.com/hosein-yousefii/kubernetes-glusterfs-volume-check/blob/master/LICENSE)
![LinkedIn](https://shields.io/badge/style-hoseinyousefi-black?logo=linkedin&label=LinkedIn&link=https://www.linkedin.com/in/hoseinyousefi)

This is a script to Find Glusterfs volume id related to persistent volume in kubernetes also, Check Glusterfs volume existance in kubernetes using two methods, file and input.



## What is the problem?

If you have worked with Glusterfs as storage class in Kubernetes, you realised that sometimes deleted pvs (persistent volumes) remain in Glusterfs so, we need to delete them to make some space, but it's hard because there is not any map to see Glusterfs pvs' id.

## Solution:

I wrote an script to show a map between pvs and Glusterfs vol ids or give the script a file including glusterfs ids to check if they are used in kubernetes or not also, this script has the ability to check glusterfs vol id as input.

## Usage:

```
# list a map between pvs and glusterfs volume ids

./glusterfs-volid.sh list


# check a file containing Glusterfs volume ids with Kubernetes pvs'
# sample file "glusterfs-ids.txt":
vol_0a75ae1eefae88fd2bc558a5e410497e
vol_0bd0a59c875146e2404f56bede659057
vol_2590ed2423ef1c6b4cd6bbab109bed6d
vol_40f31ad542c0586fe317468228373e57
vol_585c1a1ae83657fe8b5f2c7f269d4887
vol_589feb415a037a0185d083fe53f82a66
vol_74a9a54a2cab260dea0d1b950c53747e
vol_74fd5d3e1e95a5ad35ad0b0f829a2bbe
vol_9904e49b1c646d5e9d63eb6ad623ef95
vol_b74c156abdf5d08446eeb47eb7a11f17
vol_bb74d02f1607dd74511d50cd8ffc9d79
vol_bbf0a1982958ed5e7eec5371ce55474a
vol_c3425eec3cbb70e1cc6e67d9d67199dc
vol_c78df149fb5a509f82d916a3278ce025
vol_ef812e1fabb89b57972b2a3f9c2b82bf


./glusterfs-volid.sh checkfile glusterfs-ids.txt

# check a vol id as input

./glusterfs-volid.sh checkinput vol_0a75ae1eefae88fd2bc558a5e410497e

```

# How to contribute?

You can fork and develop your idea.
Copyright 2022 Hosein Yousefi <yousefi.hosein.o@gmail.com>



