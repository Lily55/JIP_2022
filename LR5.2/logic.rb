# frozen_string_literal: true

# Class of Max_C ount
class NumberMax
  # rubocop:disable Metrics/MethodLength
  def self.function_of_search(arr = [])
    count = 0
    count_max = 0
    arr.each_with_index do |_, index|
      if arr[index - 1] == arr[index]
        count += 1
        count_max = count if count > count_max
      else
        count = 1
      end
    end
    count_max
  end
  # rubocop:enable Metrics/MethodLength
end
