require 'rails_helper'

describe Mission, type: :model do
  before(:each) do
    @a1 = Astronaut.create(name:"Neil Armstrong", age: 37, job: "Commander")
    @a2 = Astronaut.create(name:"Scott Kelly", age: 55, job: "Station Master")
    @m1 = Mission.create(title: "Capricorn 4", time_in_space: 294)
    @m2 = Mission.create(title: "Apollo 13", time_in_space: 122)
    @m3 = Mission.create(title: "Gemini 7", time_in_space: 491)
    @m4 = Mission.create(title: "STS-133", time_in_space: 365)
    @m5 = Mission.create(title: "Expeditions 25", time_in_space: 103)
    am1 = AstronautMission.create(astronaut_id: @a1.id, mission_id: @m1.id)
    am2 = AstronautMission.create(astronaut_id: @a1.id, mission_id: @m2.id)
    am3 = AstronautMission.create(astronaut_id: @a1.id, mission_id: @m3.id)
    am4 = AstronautMission.create(astronaut_id: @a2.id, mission_id: @m3.id)
    am5 = AstronautMission.create(astronaut_id: @a2.id, mission_id: @m4.id)
    am6 = AstronautMission.create(astronaut_id: @a2.id, mission_id: @m5.id)
  end

  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'Sorting' do
    it 'sorts missions in alphabetical order' do
      expect(@a1.missions.sorted.first.title).to eq("Apollo 13")
      expect(@a1.missions.sorted.last.title).to eq("Gemini 7")
      expect(@a2.missions.sorted.first.title).to eq("Expeditions 25")
      expect(@a2.missions.sorted.last.title).to eq("STS-133")
    end
  end

  describe 'Calculations' do
    it 'calculates total time in space' do
      
    end
  end
end
