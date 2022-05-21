require "rails_helper"

describe "astronaut index page" do
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

  it "displays the average age of all astronauts" do
    expect(page).to have_content("Average Age: 34")
  end

  it "lists the space missions of each astronaut in alpha order" do

    within "#astronaut-#{@neil.id}" do
      expect("Apollo 12").to appear_before("Is The Moon Made of Cheese?")
    end
    within "#astronaut-#{@sally.id}" do
      expect("Another Mission").to appear_before("Space Race")
      expect("Space Race").to appear_before("Wow Another")
    end
    within "#astronaut-#{@buzz.id}" do
      expect(page).to have_content("International Space Station")
    end
  end

  it "displays the total time in space for each astronaut" do
    save_and_open_page
    within "#astronaut-#{@neil.id}" do
      expect(page).to have_content("170 days")
    end
    within "#astronaut-#{@sally.id}" do
      expect(page).to have_content("440 days")
    end
    within "#astronaut-#{@buzz.id}" do
      expect(page).to have_content("80 days")
    end

  end
end
