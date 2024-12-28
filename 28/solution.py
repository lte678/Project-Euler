layer = 1
layer_seed = 1
sum = 1
while layer <= 500:
    sum += layer_seed + layer * 2
    sum += layer_seed + layer * 4
    sum += layer_seed + layer * 6
    layer_seed = layer_seed + layer * 8
    sum += layer_seed
    layer += 1

print(sum)