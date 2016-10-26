require_relative './custom_matchers/array_matcher.rb'
require_relative '../merge_sort.rb'

include MergeSort

RSpec.describe 'Merge Sort' do
# Invalid input
  context 'invalid input' do
    context 'input is nil' do
      let (:arr) {nil}

      it 'raise agrument error exception' do
        expect { merge_sort arr }.to raise_error ArgumentError
      end
    end

    context 'input is not an array' do
      let (:arr) {2}

      it 'raise argument error exception' do
        expect { merge_sort arr }.to raise_error ArgumentError
      end
    end
  end
  # Valid input
  context 'valid input' do
    #empty array
    context 'empty array' do
      let (:arr) {[]}

      it 'return empty array' do
        expect(merge_sort(arr)).to eq ([])
        #expect {merge_sort(arr)}.to eq []
      end
    end
    # 1 element array
    context '1 element array' do
      let (:arr) {[2]}

      it 'return sorted array' do
        expect(merge_sort(arr)).to eq [2]
      end
    end
    # 2 element array
    context '2 elements array' do
      let (:arr) { [3, 2] }

      it 'return sorted array' do
        expect(merge_sort(arr)).to eq [2,3]

      end
    end
    # multi elements array
    context 'multi elements array' do
      context 'increasing sorted array' do
        let (:arr) {[1,2,5,9,123]}

        it 'return sorted array' do
          expect(merge_sort arr).to eq [1,2,5,9,123]
        end
      end

      context 'decreasing sorted array' do
        let (:arr) {[199,99,88,65,5,3,0,-1]}

        it 'return sorted array' do
          expect(merge_sort arr ).to eq [-1,0,3,5,65,88,99,199]
        end
      end

      context 'uniform array' do
        let (:arr) {[1,1,1,1,1,1]}

        it 'return sorted array' do
          expect(merge_sort arr ).to eq [1,1,1,1,1,1]
        end
      end

      context 'big array' do
        let (:arr) {Array.new(10000) { rand(1.1000)} }

        it 'return sorted array' do
          expect(merge_sort arr ).to be_monotonically_increasing
        end
      end

      context 'random array' do
        let (:arr) {[1,199,2,87,4,5]}

        it 'return sorted array' do
          expect(merge_sort arr ).to eq [1,2,4,5,87,199]
        end
      end
    end

  end
end
