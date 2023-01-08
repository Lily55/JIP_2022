# frozen_string_literal: true

require_relative 'logic'

RSpec.describe WorkWithFiles do
  describe '#write_the_file' do
    array = %w[fhfd jh uheuh fo]
    it 'Create non-empty file' do
      WorkWithFiles.write_the_file(array)
      file = File.open('test.txt', 'r')
      expect(file.gets).not_to be nil
    end
  end

  describe '#read_file' do
    array = %w[fhfd jh uheuh fo]
    it 'Can read the file' do
      WorkWithFiles.write_the_file(array)
      expect(WorkWithFiles.read_file).not_to be nil
    end
  end

  describe '#read_file' do
    array = [Faker::Lorem.unique.characters(number: 2), Faker::Lorem.unique.characters(number: 5),
             Faker::Lorem.unique.characters(number: 2), Faker::Lorem.unique.characters(number: 6)]
    it 'have to show: 2' do
      WorkWithFiles.write_the_file(array)
      expect(WorkWithFiles.read_file).to eq(2)
    end
  end
end
