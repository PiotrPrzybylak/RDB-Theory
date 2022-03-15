
def device_names_system(devicenames):
    uniqueDevicenames = []
    all_names = []
    for name in devicenames:
        if name not in uniqueDevicenames:
            uniqueDevicenames.append(name)
            all_names.append(name)
        else:
            num = str(all_names.count(name))
            modif_name = name + num
            uniqueDevicenames.append(modif_name)
            all_names.append(name)
    return uniqueDevicenames

print(device_names_system(["c","o","d","e"]))
print(device_names_system(["c","o","d","e","c","o","o","l"]))