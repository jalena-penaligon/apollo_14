require 'rails_helper'

RSpec.describe 'astronauts page', type: :feature do
  before(:each) do
    @a1 = Astronaut.create(name:"Neil Armstrong", age: 37, job: "Commander")
    @a2 = Astronaut.create(name:"Scott Kelly", age: 55, job: "Station Master")
    @m1 = Mission.create(title: "Capricorn 4", time_in_space: 100)
    @m2 = Mission.create(title: "Apollo 13", time_in_space: 200)
    @m3 = Mission.create(title: "Gemini 7", time_in_space: 300)
    @m4 = Mission.create(title: "STS-133", time_in_space: 100)
    @m5 = Mission.create(title: "Expeditions 25", time_in_space: 300)
    am1 = AstronautMission.create(astronaut_id: @a1.id, mission_id: @m1.id)
    am2 = AstronautMission.create(astronaut_id: @a1.id, mission_id: @m2.id)
    am3 = AstronautMission.create(astronaut_id: @a1.id, mission_id: @m3.id)
    am4 = AstronautMission.create(astronaut_id: @a2.id, mission_id: @m3.id)
    am5 = AstronautMission.create(astronaut_id: @a2.id, mission_id: @m4.id)
    am6 = AstronautMission.create(astronaut_id: @a2.id, mission_id: @m5.id)
  end

  describe 'when a user visits /astronauts' do
    it 'displays astronauts info' do
      visit astronauts_path

      within '#neil-armstrong' do
        expect(page).to have_content(@a1.name)
        expect(page).to have_content("Age: #{@a1.age}")
        expect(page).to have_content(@a1.job)
      end

      within '#scott-kelly' do
        expect(page).to have_content(@a2.name)
        expect(page).to have_content("Age: #{@a2.age}")
        expect(page).to have_content(@a2.job)
      end
    end

    it 'displays astronauts average age' do
      visit astronauts_path

      within '#statistics' do
        expect(page).to have_content("Average Age: 46")
      end
    end

    it 'displays all astronauts missions' do
      visit astronauts_path

      within '#neil-armstrong' do
        expect(page).to have_content(@m1.title)
        expect(page).to have_content(@m2.title)
        expect(page).to have_content(@m3.title)
        expect(page).to_not have_content(@m4.title)
        expect(page).to_not have_content(@m5.title)
      end

      within '#scott-kelly' do
        expect(page).to_not have_content(@m1.title)
        expect(page).to_not have_content(@m2.title)
        expect(page).to have_content(@m3.title)
        expect(page).to have_content(@m4.title)
        expect(page).to have_content(@m5.title)
      end
    end

    it 'displays total time in space' do
      visit astronauts_path

      within '#neil-armstrong' do
        expect(page).to have_content("Time in Space: 600")
      end

      within '#scott-kelly' do
        expect(page).to_not have_content("Time in Space: 700")
      end
    end
  end
end
