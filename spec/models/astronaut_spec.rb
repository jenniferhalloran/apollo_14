require 'rails_helper'

describe Astronaut, type: :model do
  before do
    @buzz = Astronaut.create!(name: "Buzz", age: 32, job: "Engineer")
    @neil = Astronaut.create!(name: "Neil", age: 36, job: "Co-Pilot")
    @sally = Astronaut.create!(name: "Sally", age: 34, job: "Pilot")

    @mission_1 = @sally.missions.create!(title: "Space Race", time_in_space: 100)
    @mission_2 = @sally.missions.create!(title: "Another Mission", time_in_space: 200)
    @mission_3 = @sally.missions.create!(title: "Wow Another", time_in_space: 140)
    @mission_4 = @neil.missions.create!(title: "Apollo 12", time_in_space: 60)
    @mission_5 = @neil.missions.create!(title: "Is The Moon Made of Cheese?", time_in_space: 110)
    @mission_6 = @buzz.missions.create!(title: "International Space Station", time_in_space: 80)
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    it "finds the average age of all astronauts" do
      expect(Astronaut.average_age).to eq(34)
    end
  end

  describe 'instance methods' do
    it "alphabetizes the missions of an individual astronaut" do
      expect(@buzz.alphabetize_missions).to eq([@mission_6])
      expect(@sally.alphabetize_missions).to eq([@mission_2, @mission_1, @mission_3])
      expect(@neil.alphabetize_missions).to eq([@mission_4, @mission_5])

    end
  end
end
