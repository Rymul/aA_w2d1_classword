# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length < 1
        self.max - self.min
    end

    def average
        return nil if self.length < 1
        self.sum / self.length.to_f
    end

    def median
        return nil if self.length < 1
        
        if self.length % 2 != 0
            return self.sort[self.length/2]
        else
            second = self.sort[self.length/2]
            first = self.sort[self.length/2 - 1]
            return (first + second)/2.to_f
        end
    end

    def counts
        self.tally
    end

    def my_count(val)
        count = 0
        self.each do |num|
            if val == num
                count += 1
            end
        end
        count
    end

    def my_index(val)
        self.each_with_index do |n, i|
            if val == n 
                return i
            end
        end
        return nil
    end

    def my_uniq
        # self | self
        self.tally.keys
    end

    def my_transpose
        h = self.length
        w = self.length
        n_arr = Array.new(h) {Array.new(w)}
        self.each_with_index do |n1, i1|
            self.each_with_index do |n2, i2|
                n_arr[i1][i2] = self[i2][i1]
            end
        end
        n_arr
    end



end







#     describe "#my_transpose" do
#       it "should transpose a 2D array with square dimensions by returning a new 2D array where the horizontal rows are converted to vertical columns" do
#         arr_1 = [
#           ["a", "b", "c"],
#           ["d", "e", "f"],
#           ["g", "h", "i"]
#         ]
#         expected_1 = [
#           ["a", "d", "g"],
#           ["b", "e", "h"],
#           ["c", "f", "i"]
#         ]
#         expect(arr_1.my_transpose).to eq(expected_1)

#         arr_2 = [
#           ["w", "x"],
#           ["y", "z"]
#         ]
#         expected_2 = [
#           ["w", "y"],
#           ["x", "z"]
#         ]
#         expect(arr_2.my_transpose).to eq(expected_2)
#       end


#       it "should not use the built-in Array#transpose" do
#         arr = [
#           ["a", "b"],
#           ["c", "d"]
#         ]
#         expect(arr).to_not receive(:transpose)
#         arr.my_transpose
#       end
#     end
#   end
# end
