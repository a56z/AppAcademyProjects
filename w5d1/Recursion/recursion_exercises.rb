def range(min, max)
    return [] if max <= min

    range(min, max - 1) << max - 1    
end



def sum_iteration(nums)
    sum = 0
    nums.each { |num| sum+=num  }
    sum
end


def sum_recursive(nums)
    return 0 if nums.empty?

    nums[0] + sum_recursive(nums[1..-1])
end


def exponent1(base, exp)
    return 1 if exp == 0
    base * exponent1(base,exp-1) 
end

def exponent2(base, exp)
    return 1 if exp == 0
    return base if exp == 1

    half = exponent2(base, exp-1) / 2
    if exp.even?
        half * half
    else
        base * half * half
    end
end

class Array
    def deep_dup
        new_arr = []
        self.each do |el|
            new_arr << (el.is_a?(Array) ? el.deep_dup : el)
        end
        p new_arr
    end

    def dd_map
        map { |el| el.is_a?(Array) ? el.dd_map : el }
    end
end

    def fib_iterative(n)
        return [] if n == 0
        return [1] if n == 1

        fibs = [1,2]

        while fibs.count < n 
            fibs << fibs[-2] + fibs[-1]
        end
        fibs
    end

    def fib_recursive(n)
        if n <= 0
            [0,1].take(n)
        else
            fibs = fib_recursive(n-1)
            fibs << fibs[-2] + fibs[-1]
        end
        fibs
    end

class Array
    def bsearch(nums, target)
        return nil if nums.empty?

        probe_index = nums.length / 2

        case target <=> nums[probe_index]
        when -1
            bsearch(nums.take(probe_index), target)
        when 0
            probe_index
        when 1
            sub_answer = bsearch(nums.drop(probe_index+1), target)
            sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
        end
    end
end

class Array
    def merge_sort
      return self if count < 2
  
      middle = count / 2
  
      left, right = self.take(middle), self.drop(middle)
      sorted_left, sorted_right = left.merge_sort, right.merge_sort
  
      merge(sorted_left, sorted_right)
    end
  
    def merge(left, right)
      merged_array = []
      until left.empty? || right.empty?
        merged_array << (left.first < right.first) ? left.shift : right.shift
      end
  
      merged_array + left + right
    end
end

class Array
    def subsets
      return [[]] if empty?
      subs = take(count - 1).subsets
      subs.concat(subs.map { |sub| sub + [last] })
    end

    # def permutations(array)
    #     return [array] if array.length <= 1

    #     first = array.shift
    #     perms = permutations(array)
    #     total_permutations = []

    #     perms.each do |perm|
    #         (0..perm.length).each do |i|
    #             total_permutations << perms[0...i] + [first] + perm[0..-1]
    #         end
    #     end
    #     total_permutations
    # end

    def permutations(array)
        return [array] if array.length <= 1
      
      
        # Similar to the subsets problem, we observe that to get the permutations
        # of [1, 2, 3] we can look at the permutations of [1, 2] which are
        # [1, 2] and [2, 1] and add the last element to every possible index getting
        # [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1]
      
        # pop off the last element
        first = array.shift
        # make the recursive call
        perms = permutations(array)
        # we will need an array to store all our different permutations
        total_permutations = []
      
      
        # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
        # and for each permutation add first into every index. This new subarray
        # gets added to total_permutations.
        perms.each do |perm|
          (0..perm.length).each do |i|
            total_permutations << perm[0...i] + [first] + perm[i..-1]
          end
        end
        total_permutations
      end
end


def make_change(target, coins = [25, 10, 5, 1])
    return [] if target == 0
    return nil if coins.none? { |coin| coin <= target }

    coins = coins.sort.reverse
    best_change = nil
    coins.each_with_index do |coin, index|
            next if coin > target
            remainder = target - coin

        best_remainder = make_change(remainder, coins.drop(index))

        next if best_remainder.nil?
        this_change = [coin] + best_remainder

        if best_change.nil? || (this_change.count < best_change.count)
            best_change = this_change
        end
    end 
    best_change
end