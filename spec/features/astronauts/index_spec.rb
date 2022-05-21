require "rails_helper"

describe "astronaut index page" do
  before do
    @buzz = Astronaut.create!(name: "Buzz", age: 32, job: "Engineer")
    @neil = Astronaut.create!(name: "Neil", age: 36, job: "Co-Pilot")
    @sally = Astronaut.create!(name: "Sally", age: 34, job: "Pilot")
    visit "/astronauts"
  end
  it "lists each astronauts name, age, and job" do
    within "#astronaut-#{@buzz.id}" do
      expect(page).to have_content(@buzz.name)
      expect(page).to have_content(@buzz.age)
      expect(page).to have_content(@buzz.job)
    end
    within "#astronaut-#{@neil.id}" do
      expect(page).to have_content(@neil.name)
      expect(page).to have_content(@neil.age)
      expect(page).to have_content(@neil.job)
    end
    within "#astronaut-#{@sally.id}" do
      expect(page).to have_content(@sally.name)
      expect(page).to have_content(@sally.age)
      expect(page).to have_content(@sally.job)
    end
  end
end
