require 'rails_helper'

describe Astronaut, type: :model do
  before do
    @buzz = Astronaut.create!(name: "Buzz", age: 32, job: "Engineer")
    @neil = Astronaut.create!(name: "Neil", age: 36, job: "Co-Pilot")
    @sally = Astronaut.create!(name: "Sally", age: 34, job: "Pilot")
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
end
