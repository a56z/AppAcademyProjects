def sum_to(n)
    return nil if n < 1
    return n if n == 1

    n + sum_to(n-1)
end

def add_numbers(nums_array)
    return nums_array.first if nums_array.length <= 1

    nums_array.pop + add_numbers(nums_array)
end

def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1

    (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(arr, str)
    return false if arr.empty?
    return true if arr.last == str

    ice_cream_shop(arr[0...-1], str)
end

def reverse(string)
    return nil if str.length == 0
    return str if str.length == 1

    reverse(string[1..-1]) + string[0])
end
