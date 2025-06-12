def get_single_element(arr):
    count_dict = {}

    for item in arr:
        if item in count_dict:
            count_dict[item] += 1
        else:
            count_dict[item] = 1

    possible_key = set()

    for key, value in count_dict.items():
        if value != 1:
            continue
        
        if key in possible_key:
            return None

        possible_key.add(key)

    if len(possible_key) != 1:
        return None

    return possible_key.pop()

if __name__ == '__main__':
    arr = [1,2,3,4,3,1,2]
    print(get_single_element(arr))