from task2 import get_single_element

def test_1():
    assert get_single_element([1,2,3,4,3,2,1]) == 4

def test_2():
    assert get_single_element([]) == None

def test_3():
    assert get_single_element([1, 1, 2, 2, 3, 3]) == None

def test_4():
    assert get_single_element([1, 2, 3, 3, 4, 4]) == None

def test_5():
    assert get_single_element([None, 'a', None, 'b', 'b']) == 'a'