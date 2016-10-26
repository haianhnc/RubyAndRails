require_relative '../binary_search.rb'

include BinarySearch

RSpec.describe 'Binary Search' do
	context 'invalid input: nil array' do
		let (:arr) {nil}
		let (:key) {1}

		it 'array can not be null' do
			expect{binary_search arr, key}.to raise ArgumentError 
		end
	end

	context 'invalid input: is not array' do
		let (:arr) {2}
		let (:key) {2}

		it 'input must be array' do
			expect{binary_search arr, key}.to raise ArgumentError
		end
	end

	context 'valid input: test for 1st parameter' do
		context 'empty array' do
			let (:arr) {[]}
			let (:key) {2}

			it 'not found in empty array' do
				expect{binary_search arr, key}.to eq -1
			end
		end

		context '1 element array' do
			context 'key found' do
				let (:arr) {[1]}
				let (:key) {1}

				it 'found index 0' do
					expect{binary_search arr, key}.to eq 0
				end
			end

			context 'key not found' do
				let (:arr) {[1]}
				let (:key) {3}

				it  'key not found' do
					expect{binary_search arr, key}.to eq -1
				end
			end
		end

		context 'multi elements array' do
			context 'key found' do # use same case for 2nd param and key is in some index of array
				let (:arr) {[1, 2, 3, 5, 87, 99, 102, 9999]}
				let (:ar) {87}

				it 'key found in arrray' do
					expect{binary_search arr, key}.to eq 4
				end
			end

			context 'key not found' do # use same case for 2nd param test and key is in range of array
				let (:arr) {[1, 2, 3, 5, 87, 99, 102, 9999]}
				let (:ar) {88}

				it 'key not found in arrray' do
					expect{binary_search arr, key}.to eq -1
				end
			end
		end
	end
	context 'valid input: test for 2nd parameter' do
		context 'found in head of array' do
			let (:arr) {[1, 4, 7, 99, 1002]}
			let (:key) {1}

			it 'found in array' do
				expect{binary_search arr, key}.to eq 0
			end
		end

		context 'found in tail of array' do
			let (:arr) {[1, 4, 7, 99, 1002]}
			let (:key) {1002}

			it 'found in array' do
				expect{binary_search arr, key}.to eq 4
			end
		end

		context 'found in middle of array' do
			let (:arr) {[1, 4, 7, 99, 1002]}
			let (:key) {7}

			it 'found in array' do
				expect{binary_search arr, key}.to eq 2
			end
		end

		context 'key less than the smallest element' do
			let (:arr) {[1, 4, 7, 99, 1002]}
			let (:key) {-1}

			it 'not found in array' do
				expect{binary_search arr, key}.to eq -1
			end
		end

		context 'key greater than biggest element' do
			let (:arr) {[1, 4, 7, 99, 1002]}
			let (:key) {20007}

			it 'not found in array' do
				expect{binary_search arr, key}.to eq -1
			end
		end
	end
end